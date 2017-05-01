function [A] = MatrixA_to_Inv(n)
B=zeros(n+1,n+1);
A=zeros(n+1,n+1);
d=4;
f=-2;
B(1,1)=1;
for k=2:n+1
    B(k,k)=1/d;
    d=d+2;
end

for j=3:n+1
    B(j-2,j)=1/f;
    f=f-2;
end
C=inv(B);
for i=1:n+1
    for j=1:n
        A(i,j+1)=C(i,j);
    end
end
A