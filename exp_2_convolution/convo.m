%assuming both signals form 0%
clear all;
close all;
clc;
%to find linear convolution of two dts%
x=input('enter the input signal x[n]...');
h=input('enter the input signal h[n]...');
n1=length(x);
n2=length(h);
N=n1+n2-1; %length of convoluted sgnal%
T=1:N;
y1=conv(x,h)
x=[x zeros(1,(N-n1))];
h=[h zeros(1,(N-n2))];
y=zeros(1,N);
for n=1:N
    for k=1:n
        y(n)=y(n)+x(k)*h(n-k+1);
    end
end
subplot(4,1,1)
stem(T,x);
xlabel('n');
ylabel('x(n)');

subplot(4,1,2)
stem(T,h);
xlabel('n');
ylabel('h(n)');


subplot(4,1,3)
stem(T,y);
xlabel('n');
ylabel('y(n)');
title('conv of x and h y(n)=x(n)*h(n)');


subplot(4,1,4)
stem(T,y1);
xlabel('n');
ylabel('x');


