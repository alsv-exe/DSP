% To Verify Sampling Theorem:
clear all;
close all;
clc;
t=-100:01:100;
fm = 0.02;
x=cos(2*pi*fm*t);
subplot(2,2,1)
plot(t,x);
xlabel('Time in Sec');
ylabel('x(t)');
title('Continous Time Signal');

%Under-Sampling
fs1=0.01; 
n1 = - 2:2 ;
x1=cos(2*pi*fm*n1/fs1);
subplot(2,2,2)
stem(n1,x1);
hold on;
subplot(2,2,2)
plot(n1,x1,':')
title('Discrete Time Signal fs<2*fm');
xlabel('n');
ylabel('x(n)');

%Nyqusit Rate
fs2 = 0.04 ; 
n2 = - 4:4 ;
x2=cos(2*pi*fm*n2/fs2);
subplot(2,2,3)
stem(n2,x2);
hold on;
subplot(2,2,3)
plot(n2,x2,':')
title('Discrete Time Signal fs=2*fm');
xlabel('n');
ylabel('x(n)');

%Over-Sampling
fs3 = 0.5; 
n3 = - 50:50;
x3=cos(2*pi*fm*n3/fs3);
subplot(2,2,4)
stem(n3,x3);
hold on;
subplot(2,2,4)
plot(n3,x3,':')
title('Discrete Time Signal fs>2*fm');
xlabel('n');
ylabel('x(n)');