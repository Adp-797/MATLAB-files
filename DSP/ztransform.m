clc;
clear all;
close all;
%%3a%%
%H(z)=(-1+(5/2)z^-1)/(1+(1/4)z^-1-(1/8)z^-2),|z|>1/2
num=[-1,5/2];
den=[1,1/4,-1/8];
[R,p,k]=residuez(num,den);
%R is numerator of respective partial fractions coeffs
%p is the poles of the system
zplane(num,den);
title("Poles & zeros plot of H(z)");
%The system is stable since both the poles are within the unit circle
