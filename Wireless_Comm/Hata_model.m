clc;
clear all;
close all;

f=1:1:300;
Hte=100; %txr antenna height
Hre=5; %rxr antenna height
d=20000; %T-R distance
city_type=1
for i=1:length(f)
    if(city_type==1) %1 for small city
        a_Hre=0.8+((1.1.*log(f(i)))-0.7).*(Hre)-1.56.*log(f(i));
    else
        if(f(i)>=150 && f(i)<=200) %large city
            a_Hre=8.29.*(log(1.54*Hre)).*2-1.1; %f<=300MHz
        else if(f(i)>200 && f(i)<=200)
            a_Hre=3.2.*log((11.75*Hre)).*2-4.97; %f>=300MHz
        end
        end
    end
    L50(1,i)=69.55+26.16.*log(f(i))-13.82.*log(Hte)-a_Hre+(44.9-6.55.*log(Hte)).*log(d); %path loss
end
    plot(f,L50,'LineWidth',2)
    xlabel('Frequency (MHz)')
    ylabel('Propagation path loss (dB)')
    title('Hata Model');    
