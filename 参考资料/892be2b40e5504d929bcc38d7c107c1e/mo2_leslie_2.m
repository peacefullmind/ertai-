f10=0.47;
for i=1:35
    B150(i)=f10*G15(i,1);
end
B151=zeros(1,15);
B152=zeros(1,51);
B15=[B151,B150,B152];
I15=zeros(101,101);
I15(1,:)=B15*H(1);
for k=2:101
    I15(k,k-1)=H(k);
end
J15=zeros(101,40);
K15=zeros(1,40);
for n=1:40
    J15(:,41-n)=(I15^n)*F10;
    K15(1,41-n)=sum(J15(:,41-n));
end
K15=K15/0.47;
for i=1:40
    K2(i)=K15(41-i);
end
X=2011:1:2050;
hold on;
grid;
plot(X,K2,'b*-');
title('二胎政策下的人口预测');