x=xlsread('x');
y=xlsread('y');
for i=1:32
    for j=1:8
        b(i,j)=x(i+1,j)-x(1,j);
    end
end
for i=1:32
    for j=1:6
        c(i,j)=y(i+1,j)-y(1,j);
    end
end
a0=0;
for k=1:6
    for j=1:8
        for i=1:4
             x1(i)=b((i+(j-1)*4),j);
             y1(i)=c((i+(j-1)*4),k);
        end
        a=lsqcurvefit('fun',a0,x1,y1)
    end
end