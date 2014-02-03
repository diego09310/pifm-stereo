% Diego Avendaño Peces
% Script que convierte una señal estéreo a un sólo canal modulado que incluye la suma y diferencia de los canales para FM

clear, clc

[x,fs,n]=wavread('snow_106kHz.wav');            % La señal snow_106kHz.wav ha sido previamente filtrada a 30 kHz y sobremuestreada a 106 kHz

x_l=x(:,1);
x_r=x(:,2);

t=(1:length(x_l))'/106000;
max(t)

x_sum=x_l+x_r;
x_dif=x_l-x_r;

carr_19=sin(2*pi*19000*t);
carr_38=sin(2*pi*38000*t);

x_mod=x_dif.*carr_38;

x_total=0.45*x_sum+0.1*carr_19+0.45*x_mod;

x_total=x_total/max(x_total);
wavwrite(x_total,106000,16,'snow_fm_stereo.wav');

