%% Import data and Format!
close all; clear all; clc;
filename = ['test01'; 'test02'; 'test03'; 'test04'; 'test05'; 'test06';...
    'test07'; 'test08'; 'test09'; 'test10'; 'test11'; 'test12';'test13';...
    'test14'; 'test15'; 'test16'; 'test17'; 'test18'; 'test19'; 'test20';...
    'test21'; 'test22'; 'test23'; 'test24'; 'test25'; 'test26'; 'test27';...
    'test28'; 'test29'; 'test30'; 'test31'; 'test32']%; 'test33'; 'test34';...
    %'test35'; 'test36'; 'test37'; 'test38'];
       

fL = size(filename); % should be an even number (if not, check 'filename')
epsilon1 = zeros(1,fL);
epsilon2 = zeros(1,fL);
frequency = zeros(1,fL);
T = [100.1 98.9 97.9 96.9 96 94.6 93.5 92.4 91 90.1 87.9 84 82 80 77.9 75.9 74 71.9 70 68 67 66 65 64 63 61 60.1 59 58 57 56 55];
TL = length(T);
%%
for i = 0:1:fL-1;
%     filename1 = uigetfile;
%     filename2 = uigetfile;
    data1 = importdata(filename(i+1,:));

    data1(1:1,:) = [];

    n1 = length(data1);
    m = n1;

    fullMagn = zeros(m,1);
    fullMagn(1:n1) = data1(:,1)';

    fullAngl = zeros(m,1);
    fullAngl(1:n1) = data1(:,5)';

    fullFreq = zeros(m,1);
    fullFreq(1:n1) = data1(:,2)';

    % Find your epsilons!
    A = .005^2;
    eps0 = 8.854187e-12;
    d = 10e-6;
    omega = 2*pi*fullFreq;

    G = cos(fullAngl)./(fullMagn);
    C = -sin(fullAngl)./(fullMagn);
    C0 = (A*eps0)./(d);
    epsilon2(1:m,(i+1)) = G./(omega.*C0);
    epsilon1(1:m,(i+1)) = C./(omega.*C0);
    frequency(1:m,(i+1)) = fullFreq;
end
%%
Temperature = meshgrid(T,1:1:m);

%% Plot the dielectric spectrym of sample
figure(1)
surf(Temperature,log10(frequency),epsilon2, 'Linestyle', 'none');
title('Dielectric Spectrum of TSiK65')
xlabel('Temperature')
ylabel('Frequency ~ Hertz (log scale)')
zlabel('\epsilon "')


% figure(2)
% mesh(Temperature,epsilon1,epsilon2);
% title('Dielectric Spectrum of TSiK65')
% xlabel('Temperature')
% ylabel('Frequency ~ Hertz (log scale)')
% zlabel('\epsilon "')
% axis equal
