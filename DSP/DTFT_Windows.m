#dtft_m code
function [X] = dtft_m(x,n,w)
% This function takes a real discrete-time signal x, independed variable
%'n'and frequency location vector'w' as arguments and returns the DTFT 
% of the signal in a column vector.
%
    if isrow(x)== true
        x = x';    % x is a column vector
    end
    if isrow(n)== false
        n = n';     % n is a row vector
    end
    if isrow(w)== true
        w = w';     % w is a column vector
    end
    X = exp(-1j*w*n)*x; % X(e^(jw)) in column vector
end

clc;
clear all;
close all;

%For M=10
M=[10,101];
n=0:M(1,1)-1;
R=ones(1,10); %rectangular window
w=linspace(-pi,pi,512);
Xr=dtft_m(R,n,w);

subplot(311)
plot(w/pi,abs(Xr),LineWidth=2)
xlabel('Frequency, \omega')
ylabel('X_r|e^(j\omega)|')
title('DTFT of a Rectangular window, M=10')

C=0.5.*(1-cos(2*pi.*n/M(1,1)-1)).*R; %Hanning window
Xc=dtft_m(C,n,w);

subplot(312)
plot(w/pi,abs(Xc),LineWidth=2)
xlabel('Frequency, \omega')
ylabel('X_c|e^(j\omega)|')
title('DTFT of a Hanning window, M=10')

H=(0.54-0.46*cos(2*pi.*n/M(1,1)-1)).*R; %Hamming window
Xh=dtft_m(H,n,w);
subplot(313)
plot(w/pi,abs(Xh),LineWidth=2)
xlabel('Frequency, \omega')
ylabel('X_h|e^(j\omega)|')
title('DTFT of a Hamming window, M=10')

%For M=101
n=0:M(1,2)-1;
R=ones(1,101);
Xr=dtft_m(R,n,w);

figure(2)
subplot(311)
plot(w/pi,abs(Xr),LineWidth=2)
xlabel('Frequency, \omega')
ylabel('X_r|e^(j\omega)|')
title('DTFT of a Rectangular window, M=101')

C=0.5.*(1-cos(2*pi.*n/M(1,2)-1)).*R; %Hanning window
Xc=dtft_m(C,n,w);

subplot(312)
plot(w/pi,abs(Xc),LineWidth=2)
xlabel('Frequency, \omega')
ylabel('X_c|e^(j\omega)|')
title('DTFT of a Hanning window, M=101')

H=(0.54-0.46*cos(2*pi.*n/M(1,2)-1)).*R; %Hamming window
Xh=dtft_m(H,n,w);
subplot(313)
plot(w/pi,abs(Xh),LineWidth=2)
xlabel('Frequency, \omega')
ylabel('X_h|e^(j\omega)|')
title('DTFT of a Hamming window, M=101')

%As the window length M increases, the spectrum of the window decreases.
