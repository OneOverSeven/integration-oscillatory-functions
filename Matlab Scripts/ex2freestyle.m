function [] = ex2freestyle()

n=35;
x=zeros(1,n+1);
A=zeros(n+1,n+1);
T=zeros(n+1,n+1);
M=zeros(n+1,n+1);
diago=zeros(n+1,n+1);
c=ones(n+1);
c(1)=2;
f=zeros(n+1,1);
P=zeros(n+1,1);
Pprim=zeros(n+1);
gprim=zeros(n+1);

for s = 1 : n+1
    x(s) = cos(pi*(s-1/(n)));
end

for i = 0:n
    for j = 0:n
        T(i+1,j+1) = mfun('T',j,x(i+1));
    end
end

for q=1:n+1
    gprim(q)=250*(x(q)+2);
end

for j = 2:n+1
    Pprim(j)=j*mfun('U',j-1,x(i));
    syms s
    K=symprod(((j.^2)-(s.^2))/((2*s)+1), s, 0, j-1);
    M(1,j)=K;
    M(n+1,j)=((-1)^(j+1))*K;
end

for i = 2:n
    for j = 1:n+1
%         M(i,j)=(j/1-(x(i).^2))*((x(i)*mfun('T',j,x(i)))-mfun('T',j-1,x(i)));
    M(i,j)= Pprim(j) + exp(1i*pi/2)*gprim(i)*mfun('T',j,x(i));
    end
end

for i = 2:n
    for j = 1:n+1
%         M(i,j)=(j/1-(x(i).^2))*((x(i)*mfun('T',j,x(i)))-mfun('T',j-1,x(i)));
    M(i,j)= j*mfun('U',j-1,x(i))+exp(1i*pi/2)*gprim(i)*mfun('T',j,x(i));
    end
end

%The following two loops consstruct the Chebychev differentiation matrix
% represented by 'D'

for q=1:n+1
    f(q,1)=0.5*sin(0.5*(x(q)+1));
end
M
%diago

% B=(M+(1i*(diago*T)));

% P=(B\f);
[L,U] = lu(M);
a=(U\(L\f));
P=T*a;

result=(P(1)-P(n+1)*exp(1i*500));
result