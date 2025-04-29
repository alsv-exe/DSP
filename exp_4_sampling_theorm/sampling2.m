clear all;
close all;
clc;
f1=1000;  % Signal-1 Frequency
f2=1900; % Signal-2 Frequency
fmax=max(f1,f2);
T=1/min(f1,f2);
t=0:0.01*T:2*T;
x=cos(2*pi*f1*t)+cos(2*pi*f2*t); % CTS
subplot(2,2,1);
plot(t,x); grid on;
xlabel('t'); ylabel('x(t)');
title('Continuous time signal'); 
%Over Sampling Condition :
fs1=10*fmax;
n1=0:1/fs1:2*T;
x1=cos(2*pi*f1*n1)+ cos(2*pi*f2*n1);
subplot(2,2,2);
stem(n1,x1);
hold on;
plot(n1,x1,'r');grid on;
hold off;
title('Over Sampling fs>2*fm')
%Exact Sampling Part :
fs2=2*fmax;
n2=0:1/fs2:2*T; % Time Scale
x2=cos(2*pi*f1*n2)+ cos(2*pi*f2*n2);
subplot(2,2,3);
stem(n2,x2);
hold on;
plot(n2,x2,'r');grid on;
hold off;
xlabel('n'); ylabel('x(n)');
title('Exact Sampling fs=2*fm')
%Under Sampling Condition :
fs3=1.2*fmax;
n3=0:1/fs3:2*T; % Time Scale
x3=cos(2*pi*f1*n3)+ cos(2*pi*f2*n3);
subplot(2,2,4);
stem(n3,x3);
hold on;
plot(n3,x3,'r');grid on;
hold off;
xlabel('n'); ylabel('x(n)');
title('Under Sampling fs<2*fm')