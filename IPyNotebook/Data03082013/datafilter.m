%% Import data and Format!
close all; clear all; clc;
filename = ['test01'; 'test02'; 'test03'; 'test04'; 'test05'; 'test06';...
    'test07'; 'test08'; 'test09'; 'test10'; 'test11'; 'test12'; 'test13';...
    'test14'; 'test15'; 'test16'; 'test17'; 'test18'; 'test19'; 'test20';...
    'test21'; 'test22'; 'test23'; 'test24'; 'test25'; 'test26'; 'test27';...
    'test28'; 'test29'; 'test30'; 'test31'; 'test32'; 'test33'; 'test34';...
    'test35'; 'test36'; 'test37'; 'test38'; 'test39'; 'test40'; 'test41';...
    'test42'; 'test43'; 'test44'; 'test45'; 'test46'; 'test47'; 'test48';...
    'test49'; 'test50'];
       

fL = size(filename); % should be an even number (if not, check 'filename')
epsilon1 = zeros(1,fL/2);
epsilon2 = zeros(1,fL/2);
frequency = zeros(1,fL/2);
T = [40.5 39.5 36.1 35.1 34.1 33 31.9 30.9 29.9 29 28 27 25.9 25.5 25.2 25 24.6 24.4 24 23.5 22.9 22 21 20.1 19.2];
TL = length(T);
%%
for i = 1:2:fL;
%     filename1 = uigetfile;
%     filename2 = uigetfile;
    data1 = importdata(filename(i,:));
    data2 = importdata(filename(i+1,:));

    data1(1:50,:) = [];
    data2(1,:) = [];
    n1 = length(data1);
    n2 = length(data2);
    m = n1+n2;

    fullMagn = zeros(m,1);
    fullMagn(1:n1) = data1(:,1)';
    fullMagn(n1+1:m) = data2(:,1)';

    fullAngl = zeros(m,1);
    fullAngl(1:n1) = data1(:,5)';
    fullAngl(n1+1:m) = data2(:,5)';

    fullFreq = zeros(m,1);
    fullFreq(1:n1) = data1(:,2)';
    fullFreq(n1+1:m) = data2(:,2)';

    % Find your epsilons!
    A = .01^2;
    eps0 = 8.854187e-12;
    d = 5e-6;
    omega = 2*pi*fullFreq;

    G = cos(fullAngl)./(fullMagn);
    C = -sin(fullAngl)./(fullMagn);
    C0 = (A*eps0)./(d);
    epsilon2(1:m,(i+1)/2) = G./(omega.*C0);
    epsilon1(1:m,(i+1)/2) = C./(omega.*C0);
    frequency(1:m,(i+1)/2) = fullFreq;
end
%%
Temperature = meshgrid(T,1:1:m);

%% Plot the dielectric spectrym of sample
figure(1)
surf(Temperature,log10(frequency),epsilon2, 'Linestyle', 'none');
title('Dielectric Spectrum of TSiK65', 'fontsize', 18)
xlabel('Temperature', 'fontsize', 14)
ylabel('Frequency\n ~ Hertz (log)', 'fontsize', 14)
zlabel('\epsilon "', 'fontsize', 18)


% figure(2)
% mesh(Temperature,epsilon1,epsilon2);
% title('Dielectric Spectrum of TSiK65')
% xlabel('Temperature')
% ylabel('Frequency ~ Hertz (log scale)')
% zlabel('\epsilon "')
% axis equal
