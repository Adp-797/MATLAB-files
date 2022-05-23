F=10;
theta=pi/6;
A=3;
t=0:0.001:5
yt=A.*sin(2*pi*F*t + theta);
plot(t,yt,LineWidth=2);
xlabel('Time');
ylabel('Amplitude');
title('y(n)=Asin(2\piFt+\theta)');
