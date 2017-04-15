function [] = ex3dif()

n=100;
x=zeros(n+1);
D=zeros(n+1,n+1);
diag=zeros(n+1,n+1);
f=zeros(n+1,1);

for s = 1:n+1
x(s) = cos(pi*((s-1)/n));
end

for j = 1:n-1
    for k = 1:n-1
        D(j+1,k+1) = ((-1).^(k+j))/(x(j+1)-x(k+1));
    end
end

for k = 1:n-1
    
        D(k+1,k+1) = (-0.5)*(x(k+1)/(1-(x(k+1).^2)));
        D(1,k+1) = 2*((-1).^k)/(1-x(k+1));
        D(k+1,1) = (-0.5)*((-1).^k)/(1-x(k+1));
        D(k+1,n+1) = (0.5)*((-1).^(n+k))/(1+x(k+1));
        D(n+1,k+1) = (-2)*((-1).^(n+k))/(1+x(k+1));
end
D(1,1)=(1+(2*(n.^2)))/6;
D(n+1,n+1)=-(1+(2*(n.^2)))/6;
D(1,n+1)=0.5*((-1).^n);
D(n+1,1)=-0.5*((-1).^n);

for q=1:n+1
    diag(q,q)=sinh(x(q)+1);
    f(q,1)=exp(x(q)+1);
end

B=(D+(1i*diag));
% P=(B\f);
[L,U] = lu(B);
P=(U\L\f);
result=((P(1)*exp(1i*50*cosh(1+1)))-(P(n+1)*exp(1i*50*cosh(-1+1))));
result