%Message signal,m
clc;
close all;
f=5;
fs=100;
t=0:0.01:fs;
AM=1;
m=cos(2*pi*(f/fs)*t);
subplot(221);
plot(t,m,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Message signal,m');

%Carrier signal,c
AC=1;
c=cos(2*pi*(50/fs)*t);
subplot(222);
plot(t,c,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal,c');

%AM signal, 
u=AM/AC; %u is the modulation index
M=c.*(1+u.*m);
subplot(2,2,[3,4]);
plot(t,M,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('AM signal,M');

%u<1,under-modulated
AM=1;
AC=2;
u=AM/AC; %u is the modulation index
M=AC.*(1+(u.*m)).*c;
figure(2);
subplot(311);
plot(t,M,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Under-modulated wave,u<1');

%u>1,over-modulated
AM=2;
AC=1;
u=AM/AC; %u is the modulation index
M=AC.*(1+(u.*m)).*c;
subplot(312);
plot(t,M,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Over-modulated wave,u>1');

%u=1,Perfect-modulation
AM=2;
AC=2;
u=AM/AC; %u is the modulation index
M=AC.*(1+(u.*m)).*c;
subplot(313);
plot(t,M,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Critical-modulation wave,u=1');
