clear all;
close all;
clc;
N=input('enter the value of N= ');
n=0:1:N-1;
x=input('enter input signal x(n) ');
%%%%%%%%%%%%%%manual computation of DFT
X=zeros(N,1);
for k=0:N-1
    for nn=0:N-1
        X(k+1)=X(k+1)+(x(nn+1)*exp(-j*2*pi*nn*k/N));
    end
end
X=abs(X)';

subplot(3,1,1)
stem(n,x);
%%%%%%%%%%usinf FFT command
X_fft=abs(fft(x));
subplot(3,1,2)
stem(n,X);grid ;
xlabel('Freq (k)');
ylabel('X(k) manual');
title('manual computation of DFT');

subplot(3,1,3)
stem(n,X_fft);
xlabel('frequency (k)');
ylabel('X(k) command');
title('computation by command');
