function GM=huise(data,N)
T=length(data); 
X0=data;
for i=2:T
   X1(1)=X0(1);
   X1(i)=X1(i-1)+X0(i);                %用AGO生成一阶累加生成模块
end
for i=1:T-1
   M(i)=-(0.5*(X1(i)+X1(i+1)));
end
B=zeros(T-1,2);                       %构造累加矩阵B
for i=1:T-1
     for j=1:2
         if j<2
            B(i,j)=M(i);
         elseif j>1
            B(i,j)=1;
         end
     end
end
for i=2:T                          %构造常数项向量Y
    Y(i-1)=X0(i);
end
HCS=inv(B'*B)*B'*Y'             %用最小二乘法求灰参数HCS
H=HCS';
for i=2:T+N                        %计算出累加序列
XR1(i)=(X0(1)-H(2)/H(1))*exp(-1*H(1)*(i-1))+H(2)/H(1);
end
for i=T+1:T+N                      %还原计算出预测值
        K(i-T)=XR1(i)-XR1(i-1);
end
GM=K;