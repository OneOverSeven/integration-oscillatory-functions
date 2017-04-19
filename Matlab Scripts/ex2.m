function [] = ex2()

n=55;
x=zeros(1,n+1);
A=zeros(n+1,n+1);
T=zeros(n+1,n+1);
D=zeros(n+1,n+1);
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

%The following two loops consstruct the Chebychev differentiation matrix
% represented by 'D'
% for j = 1:n-1
%     for k = 1:n-1
%         D(j+1,k+1) = ((-1).^(k+j))/(x(j+1)-x(k+1));
%     end
% end
% 
% for k = 1:n-1
%     
%         D(k+1,k+1) = (-0.5)*(x(k+1)/(1-(x(k+1).^2)));
%         D(1,k+1) = 2*((-1).^k)/(1-x(k+1));
%         D(k+1,1) = (-0.5)*((-1).^k)/(1-x(k+1));
%         D(k+1,n+1) = (0.5)*((-1).^(n+k))/(1+x(k+1));
%         D(n+1,k+1) = (-2)*((-1).^(n+k))/(1+x(k+1));
% end
% %Initialisation of the values on the corners of the differentiation matrix
% D(1,1)=(1+(2*(n.^2)))/6;
% D(n+1,n+1)=-(1+(2*(n.^2)))/6;
% D(1,n+1)=0.5*((-1).^n);
% D(n+1,1)=-0.5*((-1).^n);

for q=1:n+1
    diago(q,q)=250*(x(q)+2);
    f(q,1)=0.5*sin(0.5*(x(q)+1));
end

%diago

B=((T*A)+(1i*(diago*T)));

% P=(B\f);
[L,U] = lu(B);
a=(U\(L\f));
P=T*a;

result=(P(1)-P(n+1)*exp(1i*500));
result
