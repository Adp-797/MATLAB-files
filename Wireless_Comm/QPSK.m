clc;
clear all;
close all;

%quadrature carrier signals
Tb=1;
t=0:(Tb/100):Tb;
fc=1;
c1=sqrt(2/Tb)*cos(2*pi*fc*t);
c2=sqrt(2/Tb)*sin(2*pi*fc*t); %QPSK uses two carrier waves

subplot(221)
plot(t,c1,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal 1');

subplot(222)
plot(t,c2,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal 2');

%Generating message signal
N=16;
m=rand(1,N);
t1=0;
t2=Tb;
for i=1:2:(N-1)
    t=t1:(Tb/100):t2;
    if m(i)>0.5 %odd bits
        m(i)=1;
        m_s=ones(1,length(t));
    else
        m(i)=0;
        m_s=zeros(1,length(t));
    end
    odd_sig(i,:)=c1.*m_s;
    
    if m(i+1)>0.5 %even bits
        m(i+1)=1;
        m_s=ones(1,length(t));
    else
        m(i+1)=0;
        m_s=zeros(1,length(t));
    end
    even_sig(i,:)=c2.*m_s;
    
    %plotting QPSK
    qpsk=odd_sig + even_sig;
    subplot(224)
    plot(t,qpsk(i,:),LineWidth=2)
    xlabel('Time');
    ylabel('Amplitude');
    title('QPSK modulation');
    grid on; 
    hold on;
    t1=t1+(Tb+0.01);
    t2=t2+(Tb+0.01);
    
end
hold off;

%message signal in bits
subplot(223)
stem(m,'filled');
xlabel('Time');
ylabel('Amplitude');
title('Binary data');
