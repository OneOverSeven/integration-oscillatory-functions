function [diag] = diagEx2(n)
x=zeros(n+1);
diag=zeros(n+1,n+1);

for l=0:n
    x(l+1) = -1+2*(l-1/n);
    diag(l+1,l+1)=(1000*x(l+1));
end
