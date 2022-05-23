clc;
clear all;
close all;

%Free space
Pr1_f=(10^-6);
d1=1000;
f=1800*(10^6);
c=3*(10^8);
l=c/f;
Pt_f=(Pr1_f*16*pi*pi*(d1^2))/(l*l); %transmitted power

%Pr at d=2KMs
d2=2000;
Pr2_f=(Pt_f*l*l)/(16*pi*pi*(d2^2));

%Pr at d=5KMs
d5=5000;
Pr5_f=(Pt_f*l*l)/(16*pi*pi*(d5^2));

%Pr at d=10KMs
d10=10000;
Pr10_f=(Pt_f*l*l)/(16*pi*pi*(d10^2));

%Pr at d=20KMs
d20=20000;
Pr20_f=(Pt_f*l*l)/(16*pi*pi*(d20^2));

%2-ray Model
ht=40;hr=3;
Pr1_r=Pr1_f;
Pt_r=(Pr1_r*(d1^4))/(ht*ht*hr*hr);

%Pr at d=2kms
Pr2_r=(Pt_r*ht*ht*hr*hr)/(d2^4);

%Pr at d=5kms
Pr5_r=(Pt_r*ht*ht*hr*hr)/(d5^4);

%Pr at d=10kms
Pr10_r=(Pt_r*ht*ht*hr*hr)/(d10^4);

%Pr at d=20kms
Pr20_r=(Pt_r*ht*ht*hr*hr)/(d20^4);

stem(d2,Pr2_f,'filled')
axis([1000 20000 0 3*(10^-7)]);
grid on;
hold on;
stem(d5,Pr5_f,'filled')
hold on;
stem(d10,Pr10_f,'filled')
hold on;
stem(d20,Pr20_f,'filled')
hold on;
stem(d2,Pr2_r,'filled')
hold on;
stem(d5,Pr5_r,'filled')
hold on;
stem(d10,Pr10_r,'filled')
hold on;
stem(d20,Pr20_r,'filled')
xlabel('Distance in m',FontWeight='bold');
ylabel('Power in Watts',FontWeight='bold');
title('Received Power(Pr) for Free space and 2-ray models');
legend('Fs at 2km','Fs at 5km','Fs at 10km','Fs at 20km','2-ray at 2km','2-ray at 5km','2-ray at 10km','2-ray at 20km');




