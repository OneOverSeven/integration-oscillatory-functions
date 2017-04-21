function [] = ex2dif()

n=35;
x=zeros(n+1,1);
D=zeros(n+1,n+1);
diag=zeros(n+1,n+1);
f=zeros(n+1,1);

for s = 1 : n+1
x(s,1) = cos(pi*((s-1)/n));
end

% for s = 1 : n+1
% x(s) = cos(0.5*pi*(((2*s)-1)/(2*n)));
% end
% x(n+1)=-1;
% x(1)=1;

for j = 1:n-1
    for t = 1:n-1
        D(j+1,t+1) = ((-1).^(t+j))/(x(j+1,1)-x(t+1,1));
    end
end

for k = 1:n-1
    
        D(k+1,k+1) = (-0.5)*(x(k+1,1)/(1-(x(k+1,1).^2)));
        D(1,k+1) = 2*((-1).^k)/(1-x(k+1,1));
        D(k+1,1) = (-0.5)*((-1).^k)/(1-x(k+1,1));
        D(k+1,n+1) = (0.5)*((-1).^(n+k))/(1+x(k+1,1));
        D(n+1,k+1) = (-2)*((-1).^(n+k))/(1+x(k+1,1));
end
D(1,1)=(1+(2*(n.^2)))/6;
D(n+1,n+1)=-(1+(2*(n.^2)))/6;
D(1,n+1)=0.5*((-1).^n);
D(n+1,1)=-0.5*((-1).^n);

for q=1:n+1
    diag(q,q)=0.5*(x(q,1)+2);
    f(q,1)=0.5*sin(0.5*(x(q,1)+1));
end

B=(D+(1i*diag));
P1=(B\f);
[U,S,V] = svd(B);
P2=((V')\(S\(U\f)));
[L,UU] = lu(B);
P3=(UU\L\f);
result1=(P1(1)-P1(n+1)*exp(1i*1000));
result2=(P2(1)-P2(n+1)*exp(1i*1000));
result3=(P3(1)-P3(n+1)*exp(1i*1000));
result1
result2
result3
% D
% diag
% B
% f