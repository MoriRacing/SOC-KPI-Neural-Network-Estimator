# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 22:55:41 2020

@author: User
"""

import torch

model_weights = torch.load("mnist_model_fully_connected.pt")
print(model_weights)