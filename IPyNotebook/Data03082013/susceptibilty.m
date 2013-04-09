close all; clear all; clc;
epsilon = [11.8 8.6 7.7 7.1 5.75 5.1 4.75 4.25 3.7 3.00];
susc = epsilon.^-1;
temp = [20.6 22.2 23 24 25 25.7 26.6 27.2 28.8 31.7]; 
x = temp;
y = susc;

plot(temp,susc,'.');
hold on

fun = @(A,B,gamma,x) A*x.^(gamma) + B;

fittedmodel = fit(x',y',fun,'StartPoint', [0 0 1]);
plot(fittedmodel, 'r');

disp(fittedmodel);
xlabel('Temperature (C^\circ)')
ylabel('(\Delta \epsilon)^{-1}')
title('Susceptibility of Liquid Crystals')
grid on

%%
close all; clear all; clc;
epsilon = [15.5 14.5 15.5 15.5 16 16.5 16.8 17.5 18 18.5 19 19.7 20.5 21 22];
susc = epsilon.^-1;
temp = [40.5 39.5 36.1 35.1 34.1 33 31.9 30.9 29.9 29 28 27 25.9 25.5 25.2]; 
x = temp;
y = susc;

plot(temp,susc,'.');
hold on

fun = @(A,B,gamma,x) A*x.^(gamma) + B;

fittedmodel = fit(x',y',fun,'StartPoint', [0 0 1]);
plot(fittedmodel, 'r');

disp(fittedmodel);
xlabel('Temperature (C^\circ)')
ylabel('(\Delta \epsilon)^{-1}')
title('Susceptibility of Liquid Crystals')
grid on