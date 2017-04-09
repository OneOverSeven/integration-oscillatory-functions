%Matrice de différentiation

function [] = Besseldif()
a=-1;
b=1;
n=500;
x=zeros(1,n+1);
D=zeros(n+1,n+1);
diag=zeros(n+1,n+1);
% lambda=(b-a)/2;
f=0.5*ones(n+1,1);
p=100;%l'ordre de la fonction de Bessel
J=zeros(51); %le vecteur contenant les valeurs de la fonction de besselici de 80 à 130
z=zeros(51);
c=ones(n+1);
c(1)=2;

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

for y=1:51
yy=y+79;
P=zeros(n+1,1);
    for l=0:n
        diag(l+1,l+1)=pi*((yy*cos(pi*x(l+1)))-p);
    end
    B=(D+(1i*diag));
    P=(B\f);
    J(y)=real((P(1)*exp(1i*(-p*pi)))-(P(n+1)*exp(1i*(p*pi))));
end
for kk=1:51
   z(kk)=kk;
end
plot(z+79,J)