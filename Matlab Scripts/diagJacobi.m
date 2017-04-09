%Matrice de différentiation

function [diag] = diagJacobi(y,n)
x=zeros(n+1);
diag=zeros(n+1,n+1);
p=100;%l'ordre de la fonction de Bessel

for l=0:n
    x(l+1) = (l-1)/n;
    diag(l+1,l+1)=(y*cos(x(l+1)))-p;
end
