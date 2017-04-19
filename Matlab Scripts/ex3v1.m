function [] = ex3v1()
n=60;
x=zeros(1,n+1);
A=zeros(n+1,n+1);
T=zeros(n+1,n+1);
diago=zeros(n+1,n+1);
c=ones(n+1);
c(1)=2;
f=zeros(n+1,1);
P=zeros(n+1,1);

for s = 1 : n+1
    x(s) = cos(pi*(s-1/(n)));
end

% for s = 1 : n+1
%     x(s) = -1 + 2*(s-1/n);
% end

for i = 0:n
    for j = 0:n
        T(i+1,j+1) = mfun('T',j,x(i+1));
    end
end

for i = 0:n
    for j = 0:n
        if ((i<j)&&(mod((i+j),2)))
                A(i+1,j+1)=2*j/c(i+1);
        end
    end
end
for q=1:n+1
    diago(q,q)=sinh(x(q)+1);
    f(q,1)=exp(x(q)+1);
end

B=((T*A)+(1i*(diago*T)));

% P=(B\f);
[L,U] = lu(B);
a=(U\(L\f));
P=T*a;
result=((P(1)*exp(1i*50*cosh(1+1)))-(P(n+1)*exp(1i*50*cosh(-1+1))));
result