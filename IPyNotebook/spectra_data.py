#!/usr/bin/env python
"""
spectra_data.py

Created by Zachary Sailer on 2013-03-17.
Copyright (c) 2013 __MyCompanyName__. All rights reserved.
"""

import sys
import os
%pylab
from mpl_toolkits.mplot3d import Axes3D

files = ['test41','test42']

test = np.loadtxt('Mar8/'+files[0], dtype=float,delimiter='\t')
m = test.T[0]
f = test.T[1]
a = test.T[4]

test2 = np.loadtxt('Mar8/'+files[1], dtype=float,delimiter='\t')
m2 = test2.T[0]
f2 = test2.T[1]
a2 = test2.T[4]

magn = np.concatenate((m,m2))
freq = np.concatenate((f,f2))
angl = np.concatenate((a,a2))

A = .01**2;
eps0 = 8.854187e-12;
d = 5e-6;
omega = 2*np.pi*freq;

G = cos(angl)/(magn);
C = -sin(angl)/(magn);

C0 = (A*eps0)/(d);
e2 = G/(omega*C0);
e1 = C/(omega*C0);

plt.figure(1)
semilogx(freq,e2,'r.')
xlabel('Frequency')
ylabel('$\epsilon$')
title('Dielectric Spectrum')
grid()

plt.figure(2)
plot(e1,e2,'.')
xlabel('$\epsilon$`')
ylabel('$\epsilon$"')
title('Cole-Cole Plot')
grid()
axis('equal')