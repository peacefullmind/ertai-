f10=0.47;
f00=0.46;
for i=1:35
    B10(i)=f10*G10(i,1);
end
B101=zeros(1,15);
B102=zeros(1,51);
B1=[B101,B10,B102];
I10=zeros(101,101);
I10(1,:)=B1*H(1);
for k=2:101
    I10(k,k-1)=H(k);
end
J10=zeros(101,40);
K10=zeros(1,40);
for n=1:40
    J10(:,41-n)=(I10^n)*F10;
    K10(1,41-n)=sum(J10(:,41-n));
end
K10=K10/0.4856;
for i=1:40
    K1(i)=K10(41-i);
end
X1=2011:1:2050;
subplot(1,2,1);
plot(X1,K1,'b*-');
title('原计划生育下的人口预测');

for i=1:35
    B00(i)=f00*G00(i,1);
end
B0=[B101,B00,B102];
I00=zeros(101,101);
I00(1,:)=B0*H(1);
for k=2:101
    I00(k,k-1)=H(k);
end
J00=zeros(101,10);
K00=zeros(1,10);
for n=1:10
    J00(:,11-n)=(I00^n)*F00;
    K00(1,11-n)=sum(J00(:,11-n));
end
K00=K00/0.4753;
for i=1:10
    K0(i)=K00(11-i);
end
X0=2001:1:2010;
for i=1:10
    E3(i)=10000*E(1,17-i);
end
subplot(1,2,2);
hold on
plot(X0,K0,'g:','linewidth',2);
plot(X0,E3,'b*-','linewidth',2);
title('leslie检测') ;
legend('理论值','实际值');