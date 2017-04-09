function [T] = matrixT(n)
T=zeros(n+1,n+1);
x=zeros(n+1);

for s = 1 : n+1
    x(s) = -1+2*(s-1/n);
end

for i = 0:n
    for j = 0:n
        T(i+1,j+1) = mfun('T',j,x(j+1));
    end
end