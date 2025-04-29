clear all;
close all;
clc;
N=input('enter the value of N=');
n=0:1:N-1;
x=input('enter the values of signal x(n)= ');
X_fft=fft(x);
x_manual=zeros(N,1);
for nn=0:N-1
   for k=0:N-1
     x_manual(nn+1)=x_manual(nn+1)+(X_fft(k+1)*exp(j*2*pi*nn*k/N) );
end
end
x_manual=abs(x_manual/N)';
x_ifft=ifft(X_fft);
subplot(3,1,1);
stem(n,abs(X_fft));
xlabel('freq in k');
ylabel('|x[k]|');
title('DFT using command');

subplot(3,1,2);
stem(n,real(x_manual));
xlabel('time');
ylabel('amplitude');
title('reconstructed signal using manual DFT');

subplot(3,1,3);
stem(n,real(x_ifft));
xlabel('time');
ylabel('amplitude');
title('reconstructed signal using IDFT command');