clc;
clear all;
close all;

x=[3,2,1,0,1,2];
nx=0:5;
w=linspace(0,pi,512);

%DTFT
Xd=dtft_m(x,nx,w);
subplot(221)
plot(w/pi,abs(Xd),LineWidth=2)
xlabel('Frequency, \omega in radians')
ylabel('|X(e^(j\omega)|')
title('DTFT of x(n)')
subplot(222)
plot(w/pi,angle(Xd),LineWidth=2)
xlabel('Frequency, \omega in radians')
ylabel('\angleXe^(j\omega)')
title('DTFT of x(n)')

%DFT
n=0:length(x)-1;
N=length(x);
k=0:N-1; %N-point DFT
Xf=fft(x); %computed using FFT algorithm
subplot(223)
stem(2*k(k>=0 & k<=N/2)/N, abs(Xf(k>=0 & k<=N/2)),'filled')
xlabel('Frequency, \omega in radians')
ylabel('|X(e^(j\omega)|')
title('DFT of x(n)')
subplot(224)
stem(2*k(k>=0 & k<=N/2)/N, angle(Xf(k>=0 & k<=N/2)),'filled')
xlabel('Frequency, \omega in radians')
ylabel('\angleX(e^(j\omega)')
title('DFT of x(n)')
