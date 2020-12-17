x0=input('input x0 please:');
n=input('input n please:'); %输入上述向量x0的长度
x1=cumsum(x0);%求向量x0的累加和
for i=1:n-1
    for j=1:2
        if j==1
           B(i,j)=-0.5*(x1(i)+x1(i+1));
        else
           B(i,j)=1;
        end
    end
end
for i=2:n
    Y(i-1)=x0(i);
end
Yn=Y';
a=inv(B'*B)*B'*Yn;
disp(a);
t=input('input t:');
for i=1:t
    if i==1
        P=Prediction(i)
    else
        P=Prediction(i)-Prediction(i-1);
    end
    disp(P);
end
