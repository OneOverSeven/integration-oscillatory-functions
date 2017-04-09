function [] = ex2dif()

n=250;
x=zeros(1,n+1);
D=zeros(n+1,n+1);
diag=zeros(n+1,n+1);
f=zeros(n+1,1);

for s = 1 : n+1
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


for l=0:n
    diag(l+1,l+1)=((2*x(l+1))+4);
    f(l+1)=0.5*sin(0.5*(x(l+1)+1));
end

B=(D+(1i*diag));
P=(B\f);
result=(P(1)*exp(1i*1000))-P(n+1);

result