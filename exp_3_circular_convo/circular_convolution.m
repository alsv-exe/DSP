clear all;
close all;
clc;

x1=input("enter the first sequence : ");
x2=input("enter the second sequence : ");

n1=length(x1);
n2=length(x2);
n=max(n1,n2);

if(n1>n2)
    x2=[x2,zeros(1,n1-n2)];
end

if(n1<n2)
    x1=[x1,zeros(1,n2-n1)];
end
y=[];

for i=1:n
    x=0;
    for j=1:n
        x=x+(x1(j)*x2(mod(i-j,n)+1));
    end
    y=[y,x];
end

subplot(3,1,1);
stem(x1);grid;

subplot(3,1,2);
stem(x2);grid;

subplot(3,1,3);
stem(y);grid;
