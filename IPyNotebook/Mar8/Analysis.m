%% Converts Impedance Analyzer data to Matlab Plots
clc; clear all; close all;

filename = ['test03'; 'test04'];
data1 = importdata(filename(1,:));
data2 = importdata(filename(2,:));
data1(1:30,:)=[];
n1=length(data1);
n2=length(data2);
m = n1 +n2;

data = zeros(m,5);
data(1:n1,:) = data1;
data(n1+1:m,:) = data2;


magn = data(:,1);
freq = data(:,2);
% imag = (-1).*data(:,3);
% real = data(:,4);
angl = data(:,5);
%%
A = .01^2;
eps0 = 8.854187e-12;
d = 5e-6;
omega = 2*pi*freq;

if (magn(3) > 10^(-2))
    G = cos(angl)./(magn);
    C = -sin(angl)./(magn);
else
    G = magn.*cos(angl);
    C = magn.*sin(angl);
end
C0 = (A*eps0)./(d);
e2 = G./(omega.*C0);
e1 = C./(omega.*C0);


%% Frequency Sweep Data

figure(1)
%subplot(2,2,1)
semilogx(freq,e1,'.');
title('Permittivity Storage vs. Frequency (39.5^{\circ}C)', 'fontsize', 18)
xlabel('f (Hz)', 'fontsize', 16)
ylabel('\epsilon`', 'fontsize', 16)
axis([10^2 10^6 0 22])
grid on
hold on

% figure(2)
% %subplot(2,2,3)
% semilogx(freq,e2,'.');
% title('Permittivity Loss vs. Frequency (39.5^{\circ}C)', 'fontsize', 18)
% xlabel('f (Hz)', 'fontsize', 16)
% ylabel('\epsilon"', 'fontsize', 16)
% axis([10^2 10^6 0 7])
% grid on
% hold on
% 
% figure(3)
% %subplot(2,2,4)
% plot(e1,e2,'.');
% title('Cole-Cole Plot (39.5^{\circ}C)', 'fontsize', 18)
% xlabel('\epsilon`', 'fontsize', 16)
% ylabel('\epsilon"', 'fontsize', 16)
% axis equal
% axis ([.7 21 -3.5 12.1])
% grid on
% hold on

% %% Fitting the Theory over the data
% close all
% 
% figure(1)
% %subplot(2,2,1)
% semilogx(freq,e1,'.');
% title('Storage Dielectic Permittivity vs. Frequency')
% xlabel('f (Hz)')
% ylabel('\epsilon`')
% grid on
% hold on
% 
% x = freq;
% y = e1;
% 
% grid on
% title('Debye Dispersion Theory')
% xlabel('Frequency (kHz)')
% ylabel('\epsilon')
% 
% fun = @(Einf,delE,relaxFreq,beta,g,x) real(Einf + (delE./(1 + (1i.*(x./relaxFreq)).^(beta))) + g);
% realmodel = fit(x,y,fun,'StartPoint',[0 3 10^(4) 0 0]);
% plot(realmodel,'g')
% disp(realmodel)
% %%
% 
% figure(2)
% %subplot(2,2,3)
% semilogx(freq,e2,'.');
% title('Permittivity Loss vs. Frequency')
% xlabel('f (Hz)')
% ylabel('\epsilon"')
% grid on
% hold on
% 
% x = freq;
% y = e2;
% 
% grid on
% title('Debye Dispersion Theory')
% xlabel('Frequency (kHz)')
% ylabel('\epsilon')
% 
% fun = @(Einf,delE,relaxFreq,beta,g,x) imag(Einf + (delE./(1 + (1i.*(x./relaxFreq)).^(beta))) + g);
% imaginarymodel = fit(x,y,fun,'StartPoint',[0 5 10^(3) 1 0]);
% plot(imaginarymodel,'r')
% disp(imaginarymodel)


