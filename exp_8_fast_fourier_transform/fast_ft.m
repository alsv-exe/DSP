%% To implement decimation in time fast FT
clear all;
close all;
clc;
x=input('enter the sequence');
p=nextpow2(length(x));
x=[x zeros(1,(2^p)-length(x))];
N=length(x);
s=log2(N);
x=bitrevorder(x);
for stage=1:s
p=1;
q=1+2^(stage-1);
n=0;
while(n<=(2^(stage-1)-1)&&q<=N)
    w=exp(-j*2*pi*(n/(2^stage)));
    y=x(p)+w*x(q);
    z=x(p)-w*x(q);
    x(p)=y;
    x(q)=z;
    p=p+1; q=q+1; n=n+1;
    if(rem(q,2^stage)==1)
        p=p+2^(stage-1);
        q=q+2^(stage-1);
        n=0;
    end
end
    end
   X=x; 