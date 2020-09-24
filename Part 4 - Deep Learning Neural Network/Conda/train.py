# Rede Neural Artificial para estimar o SOC
# Baseado nos dados simulados em laboratório da célula A123
# Perfil de corrente UDDS
# Dados de entrada: SOC estimado pelo SPKF e KPI dos dados UDDS
# Autor: Fábio de Souza Moraes Mori
#Código auxiliar: Funções

from tqdm import tqdm
import numpy as np
import torch
import torch.nn.functional as F
import torch.nn as nn
import matplotlib.pyplot as plt

# Funções auxiliares
def batchify_data(x_data, y_data, batch_size):
    """Takes a set of data points and labels and groups them into batches."""
    # Separar os dados em lotes e usar apenas eles
    N = int(len(x_data) / batch_size) * batch_size
    batches = []
    for i in range(0, N, batch_size):
        batches.append({
            'x': torch.tensor(x_data[i:i+batch_size], dtype=torch.float32),
            'y': torch.tensor(y_data[i:i+batch_size], dtype=torch.float32
        )})
    return batches

def outing_numpy(predictions):
    
    i = 0
    lenght = len(predictions) 
    outing = np.zeros(lenght)
    
    for i in range(lenght):
        outing[i] = predictions[i]
        i=i+1

    return outing

def compute_SOC_accuracy(predictions, y):
    # Calcular a accuracy do SOC estimado em relação ao SOC real
    i = 0
    lenght = len(predictions) 
    accepty = np.zeros(lenght)
    
    for i in range(lenght):
        bhight = y*1.05
        blower = y*0.95
        
        if predictions[i] > bhight[i]:
            accepty[i] = 0
            i=i+1
        elif predictions[i] < blower[i]:
            accepty[i] = 0
            i=i+1
        else: 
            accepty[i] = 1
            i = i+1
    return np.mean(accepty)

# Procedimento de Treinamento
def train_model(train_data, val_data, model, lr=0.01, momentum=0.9, nesterov=False, n_epochs=30):
    " Treinar o modelo por N épocas com os dados e os hiper parâmetros "
    # Utilizando o otimizador Stochastic Gradient Descent
    optimizer = torch.optim.SGD(model.parameters(), lr=lr, momentum=momentum, nesterov=nesterov)

    for epoch in range(1, 101):
        print("-------------\nEpoch {}:\n".format(epoch))
        # Treinamento
        loss, acc, error, sochat = run_epoch(train_data, model.train(), optimizer)
        print('Train loss: {:.6f} | Train accuracy: {:.6f}'.format(loss, acc))

        # Validação
        val_loss, val_acc, error, sochat = run_epoch(val_data, model.eval(), optimizer)
        print('Val loss:   {:.6f} | Val accuracy:   {:.6f}'.format(val_loss, val_acc))

        # Salvando o modelo
        torch.save(model, 'mnist_model_fully_connected.pt')
    return val_acc

def run_epoch(data, model, optimizer):

    " Treinando o modelo para cada interação com os dados de treinamento e .."
    " .. retornando os valores de loss e accuracy"
    # Criando os vetores a serem armazenados as respostas
    losses = []
    batch_accuracies = []
    outing = []
    outing_soc = []
    soc_estimating = []

    # Se o modelo esta em treinamento, utilizar o otimizador
    is_training = model.training

    # Iteração através do batches
    for batch in tqdm(data):
        # Criando o tensor com X e Y
        x, y = batch['x'], batch['y']

        # Inserindo dados no modelo e obtendo a resposta
        out = (model(x))
        outing.append(out)
        outing_soc.append(outing_numpy(out))

        # Calculando e armazenando o valor do accuracy
        batch_accuracies.append(compute_SOC_accuracy(out,y))

        # Calculando o loss
        loss = F.mse_loss(out, y)
        losses.append(loss.data.item())

        # Se esta em treinamento, faça a atualização
        if is_training:
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()

    # Calcular a média das épocas
    avg_loss = np.mean(losses)
    avg_accuracy = np.mean(batch_accuracies)
    
    return avg_loss, avg_accuracy, losses, outing_soc

def spkf_parameters(data, y):
    
    losses_spkf = []
    batch_accuracies_spkf = []
    
    soc_spkf = torch.from_numpy(data)
    soc_real = torch.from_numpy(y)
        
    # Calculando e armazenando o valor do accuracy do SPKF
    batch_accuracies_spkf.append(compute_SOC_accuracy(soc_spkf,soc_real))    
    
    # Calculando o loss
    loss_spkf = F.mse_loss(soc_spkf, soc_real)
    losses_spkf.append(loss_spkf.data.item())
    
    # Calcular a média das épocas
    avg_loss_spkf = np.mean(losses_spkf)
    avg_accuracy_spkf = np.mean(batch_accuracies_spkf)
    
    return avg_loss_spkf, avg_accuracy_spkf, losses_spkf 