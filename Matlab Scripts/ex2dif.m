function [] = ex2dif()

n=40;
x=zeros(n+1);
D=zeros(n+1,n+1);
diag=zeros(n+1,n+1);
f=zeros(n+1,1);

for s = 1 : n+1
x(s) = cos(pi*((s-1)/n));
end

for j = 1:n-1
    for t = 1:n-1
        D(j+1,t+1) = ((-1).^(t+j))/(x(j+1)-x(t+1));
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
    diag(q,q)=0.5*((x(q))+2);
    f(q,1)=0.5*sin(0.5*(x(l+1)+1));
end

B=(D+(1i*diag));
% P=(B\f);
[L,U] = lu(B);
P=(U\L\f);
result=((P(1)*exp(125i*8))-P(n+1));
result