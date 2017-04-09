function [vec_a] = computeVec_a(n)
f=ones(n+1,1);
x=zeros(n+1);
T=matrixT(n);
A=matrixA(n);
diag=diagEx2(n);

for l=0:n
    x(l+1) = -1+2*(l-1/n);
    f(l+1,1)=sin(x(l+1));
end
B=((1/pi)*(T*A))+(1i*(diag*T));
vec_a=B\f;