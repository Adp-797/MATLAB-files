F=10;
theta=pi/6;
A=3;
t=0:0.001:5
yt=A.*sin(2*pi*F*t + theta);
subplot(211)
plot(t,yt,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('y(n)=Asin(2\piFt+\theta)');

%Sampling y(t)
Fs=10*F; %given in the question
ns=0:(5*Fs)-1; %since 5 cycles
ys=A.*sin((2*pi*F*(ns/Fs)) + theta); %divided by sampling frequency
subplot(212)
stem(ns,ys,'filled','r');
xlabel('Frequency');
ylabel('Amplitude');
title('Sampled signal, y(n)=A sin(1/5\pi+30^{o})');
