clear all;
close all;
clc;
f1=25;
f2=5;
A=3;
t=0:0.001:1;
c=A.*sin(2*pi*f1*t)+(A/2); %carrier
s=(A/2).*square(2*pi*f2*t)+(A/2); %square pulse
ask=c.*s; %ASK modulation

subplot(311)
plot(t,c,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal');

subplot(312)
plot(t,s,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Square pulse');

subplot(313)
plot(t,ask,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('ASK modulation');

%Coherent detector, Noiseless
d=demod(ask,5,25,'am');
figure(2)
subplot(211)
plot(t,d,LineWidth=2)
xlabel('Time');
ylabel('Amplitude');
title('Coherent ASK, Noiseless');

%Coherent detector with Noise
ask_n=ask+randn(size(ask));
d=demod(ask_n,5,25,'am');
subplot(212)
plot(t,d,LineWidth=2)
xlabel('Time');
ylabel('Amplitude');
title('Coherent ASK with Noise');
