function GM=huise(data,N)
T=length(data); 
X0=data;
for i=2:T
   X1(1)=X0(1);
   X1(i)=X1(i-1)+X0(i);                %��AGO����һ���ۼ�����ģ��
end
for i=1:T-1
   M(i)=-(0.5*(X1(i)+X1(i+1)));
end
B=zeros(T-1,2);                       %�����ۼӾ���B
for i=1:T-1
     for j=1:2
         if j<2
            B(i,j)=M(i);
         elseif j>1
            B(i,j)=1;
         end
     end
end
for i=2:T                          %���쳣��������Y
    Y(i-1)=X0(i);
end
HCS=inv(B'*B)*B'*Y'             %����С���˷���Ҳ���HCS
H=HCS';
for i=2:T+N                        %������ۼ�����
XR1(i)=(X0(1)-H(2)/H(1))*exp(-1*H(1)*(i-1))+H(2)/H(1);
end
for i=T+1:T+N                      %��ԭ�����Ԥ��ֵ
        K(i-T)=XR1(i)-XR1(i-1);
end
GM=K;