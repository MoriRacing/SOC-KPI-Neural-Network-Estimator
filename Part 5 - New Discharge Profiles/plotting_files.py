# -*- coding: utf-8 -*-
"""
Created on Tue Aug  4 21:56:03 2020

@author: Fabio
"""
import numpy as np
import matplotlib.pyplot as plt

time_test = np.loadtxt('../plots/time.txt')
soc_real = np.loadtxt('../plots/real.txt')
soc_network = np.loadtxt('../plots/nn.txt')

plt.plot(soc_real[:,0], 'r', label='train')
plt.plot(soc_network[:,0], 'b', label='test')
plt.title('UDDS Validation Profile at 05°C - NN Parameters 01')
plt.ylabel('SOC')
plt.xlabel('Time')
plt.legend(framealpha=1, frameon=True);
plt.grid()
plt.show()

plt.plot(soc_real[:,0], 'r', label='train')
plt.plot(soc_network[:,1], 'b', label='test')
plt.title('UDDS Validation Profile at 05°C - NN Parameters 02')
plt.ylabel('SOC')
plt.xlabel('Time')
plt.legend(framealpha=1, frameon=True);
plt.grid()
plt.show()

plt.plot(soc_real[:,1], 'r', label='train')
plt.plot(soc_network[:,2], 'b', label='test')
plt.title('UDDS Validation Profile at 15°C - NN Parameters 01')
plt.ylabel('SOC')
plt.xlabel('Time')
plt.legend(framealpha=1, frameon=True);
plt.grid()
plt.show()

plt.plot(soc_real[:,1], 'r', label='train')
plt.plot(soc_network[:,3], 'b', label='test')
plt.title('UDDS Validation Profile at 15°C - NN Parameters 02')
plt.ylabel('SOC')
plt.xlabel('Time')
plt.legend(framealpha=1, frameon=True);
plt.grid()
plt.show()

plt.plot(soc_real[:,2], 'r', label='train')
plt.plot(soc_network[:,4], 'b', label='test')
plt.title('UDDS Validation Profile at 35°C')
plt.ylabel('SOC')
plt.xlabel('Time')
plt.legend(framealpha=1, frameon=True);
plt.grid()
plt.show()

plt.plot(soc_real[:,3], 'r', label='train')
plt.plot(soc_network[:,5], 'b', label='test')
plt.title('UDDS Validation Profile at 45°C')
plt.ylabel('SOC')
plt.xlabel('Time')
plt.legend(framealpha=1, frameon=True);
plt.grid()
plt.show()