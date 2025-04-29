clear all;
close all;
clc;
%generation of various dts%
N=input("enter the number of cycle");
n=0:0.05:N;
y=10*sin(2*pi*n);
subplot(2,2,1);
plot(n,y) %ct
title('ct sine wave');grid;
subplot(2,2,2)
stem(n,y);
title('dt time wave');grid;