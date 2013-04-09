#!/usr/bin/env python
# encoding: utf-8
"""
surf_data.py

Created by Zachary Sailer on 2013-03-17.
Copyright (c) 2013 __MyCompanyName__. All rights reserved.
"""

import sys
import os
%pylab
from mpl_toolkits.mplot3d import Axes3D

files = ['test01','test02','test03','test04','test05','test06','test07','test08',
        'test09','test10','test11','test12','test13','test14','test15','test16',
        'test17','test18','test19','test20','test21','test22','test23','test24',
        'test25','test26','test27','test28','test29','test30','test31','test32',
        'test33','test34','test35','test36','test37','test38','test39','test40',
        'test41','test42','test43','test44','test45','test46','test47','test48',
        'test49','test50']

n = len(files)/2
A = .01**2;
eps0 = 8.854187e-12;
d = 5e-6;
e1=[]
e2=[]
Tem = [40.5, 39.5, 36.1, 35.1, 34.1, 33, 31.9, 30.9, 29.9, 29, 28, 27, 25.9, 25.5, 25.2,
               25, 24.6, 24.4, 24, 23.5, 22.9, 22, 21, 20.1, 19.2]
temp= []
fig = plt.figure()
ax = fig.gca(projection='3d')

for i in range(0,n,1):
    test = np.loadtxt('Mar8/'+files[i*2], dtype=float,delimiter='\t')
    m = test.T[0]
    f = test.T[1]
    a = test.T[4]

    test2 = np.loadtxt('Mar8/'+files[i*2+1], dtype=float,delimiter='\t')
    m2 = test2.T[0]
    f2 = test2.T[1]
    a2 = test2.T[4]
    
    magn = np.concatenate((m,m2))
    freq = np.concatenate((f,f2))
    angl = np.concatenate((a,a2))
    temp = np.repeat(Tem[i],len(freq))
    
    omega = 2*np.pi*freq
    G = cos(angl)/(magn)
    C = -sin(angl)/(magn)
    
    C0 = (A*eps0)/(d)
    e2 = G/(omega*C0)
    e1 = C/omega*C0
    temp = np.repeat(Tem[i],len(freq))
    temp = temp

    if i == 0:
        dielectric = e2
        frequency = freq
        temperature = temp
    else:
        dielectric = np.vstack((dielectric,e2))
        frequency = np.vstack((freq, frequency))
        temperature = np.vstack((temperature,temp))

Z = dielectric
X = np.log10(frequency)
Y = temperature
surf = ax.plot_surface(X,Y,Z, rstride=1, cstride=1, cmap=cm.coolwarm,
        linewidth=0, antialiased=False)
xlabel('Frequency (log)')
ylabel('Temperature C$^\circ$')
ax.set_zlabel('$\epsilon$"')
