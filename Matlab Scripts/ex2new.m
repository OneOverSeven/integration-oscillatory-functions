function [] = ex2new()
n=350;

x=zeros(n+1,1);
x2=zeros(2*(n+1),1);

vec_c=ones(n+1,1);
vec_c(1,1)=2;
vec_c(n+1,1)=2;

vec_c2=ones(2*(n+1),1);
vec_c2(1,1)=2;
vec_c2(2*(n+1),1)=2;

vec_a=zeros(2*(n+1),1);

vec_temp1=zeros(2*(n+1),1);
vec_temp2=zeros(n+1,1);

omega=500;

indice1=zeros(n+1,n+1);
indice2=zeros(2*(n+1),2*(n+1));

D=zeros(n+1,n+1);
S=0.5*eye(n+1,n+1);
M=zeros(n+1,n+1);
M1=zeros(n+1,n+1);
M2=zeros(n+1,n+1);

vec_f=zeros(n+1,1);

func_a=@(x) 1i*omega*(x+2)/2;
func_f=@(x) sin((x+1)/2)/2;
func_g=@(x) (x.^2+4*x+3)/4;




for s = 1 : n+1
x(s,1) = cos(pi*((s-1)/n));
end

for s = 1 : 2*(n+1)
x2(s,1) = cos(pi*(s-1)/((2*n)+1));
end

% for s = 1 : 2*(n+1)
%     for j = 1 : 2*(n+1)
%         vec_temp1(j,1) = ((1/vec_c2(j,1))*func_a(x2(j,1))*cos((s-1)*(j-1)*pi/((2*n)+1)));
%     end
%     sumvectemp1 = sum(vec_temp1);
%     vec_a(s,1) = (2/(vec_c2(s,1)*2*(n)))*sumvectemp1;
% end

% vec_a(1,1) =1i*omega;
% vec_a(2,1) =1i*omega/2;
% vec_a(1,1)=2*vec_a(1,1);
% vec_a(2*(n+1),1)=2*vec_a(n+1,1);
% vec_a

% for s = 1 : n+1
%     for j = 1 : n+1
%         vec_temp2(j,1) = ((1/vec_c(j,1))*func_f(x(j,1))*cos((s-1)*(j-1)*pi/n));
%     end
%     sumvectemp2 = sum(vec_temp2);
%     vec_f(s,1) = (2/(vec_c(s,1)*(n)))*sumvectemp2;
% end



% y = chebfun('y');
% format long
% disp('Cheb coeffs of 99x^2 + x^3:')
% p = sin((y+1)/2)/2;
% a = chebcoeffs(p)
% a(1)
y = chebfun('y');
p1 = chebfun(1i*omega*(y+2)/2,'trunc',2*(n+1));
p2 = chebfun(sin((y+1)/2)/2,'trunc',n+1);
veca = chebcoeffs(p1);
vecf = chebcoeffs(p2);

veca(1,1)=2*veca(1,1);
veca(2*(n+1),1)=2*veca(2*(n+1),1);

for i = 1 : n+1
    for j = 1 : n+1
   indice1(i,j)=abs(j-i);
   indice2(i,j)=i+j-2;
    end
    indice2(1,i)=0;
end


for i = 1 : 2*(n+1)
    for j = 1 : 2*(n+1)
   indice2(i,j)=i+j-2;
    end
    indice2(1,i)=0;
end

indice1=indice1+ones(n+1,n+1);


for i = 1 : n+1
    for j = 1 : n+1
    M1(i,j)=veca(indice1(i,j),1);
    end
end

for i = 2 : n+1
    for j = 1 : n+1
    M2(i,j)=veca(indice2(i,j),1);
    end
end

for i = 1 : n-1
    for j = 1 : n+1
    S(i,i+2)=-0.5;
    end
end

S(1,1)=1;


for i = 1 : n
    D(i,i+1)=i;
end

M=0.5*(M1+M2);
B=(D+(S*M));
% u=zeros(n+1,1);
u=(B\(S*vecf));

[UU,SS,VV] = svd(B);
u2=((VV')\(SS\(UU\(S*vecf))));

[L,UUU] = lu(B);
u3=(UUU\(L\(S*vecf)));

% indice1
% indice2
% M1
% M2
% M
% S
% B

% ub=sum(u)
% 
% vua=zeros(n+1,1);
% 
% for k = 1: n+1
%     vua(k,1)=u(k,1)*(-1).^(k-1);
% end
% 
% ua=sum(vua)

result_inv_normal=(u(1)*exp(1i*omega*func_g(1))-u(n+1)*exp(1i*omega*func_g(-1)))
result_SVD=(u2(1)*exp(1i*omega*func_g(1))-u2(n+1)*exp(1i*omega*func_g(-1)))
result_LU=(u3(1)*exp(1i*omega*func_g(1))-u3(n+1)*exp(1i*omega*func_g(-1)))

% [U,S,V] = svd(B);
% P2=((V')\(S\(U\vec_f)));
% [L,UU] = lu(B);
% P3=(UU\L\vec_f);
% result1=(P1(1)-P1(n+1)*exp(1i*1000));
% result2=(P2(1)-P2(n+1)*exp(1i*1000));
% result3=(P3(1)-P3(n+1)*exp(1i*1000));
% result1
% result2
% result3
% D
% diag
% B
% f