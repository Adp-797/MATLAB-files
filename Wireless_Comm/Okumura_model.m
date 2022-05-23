clc;
clear all;
close all;

Hte=30:1:100;    % Base Station Antenna Height 
Hre=input('Enter the receiver antenna height 3m<hre<10m : '); % Mobile Antenna Height
d =input('Enter distance from base station 1Km<d<100Km : ');  % Distance in Km
f=150:1:1920;
c=3*10^8;
lambda=(c)./(f.*10^6);
fspace_loss=[];
for i=1:length(f)
fspace_loss = 10.*log((lambda(1,i).^2)/((4*pi)^2)*d^2); %   Free Space Propagation Loss
end
Amu = 35;       % Median Attenuation Relative to Free Space (900 MHz and 30 Km)
Gain_area = 9;      % Gain due to the Type of Environment (Suburban Area)
Ghte= 20*log(Hte/200); % Base Station Antenna Height Gain Factor
if(Hre>3)
Ghre= 20*log(Hre/3);
else
Ghre = 10*log(Hre/3);
end
Pt=50; %let transmitted power=50W
Pr=10*log(Pt/fspace_loss); %received power

%   Propagation Path Loss
L50 = fspace_loss+Amu-Ghte-Ghre-Gain_area;
L50=[L50,zeros(1,1700)];
display('Propagation pathloss is : ');
disp(L50);

plot(f,L50,'LineWidth',2);
title('Okumura Model');
xlabel('Frequency (MHz)');
ylabel('Propagation Path loss(dB) at 50 Km');
grid on;

