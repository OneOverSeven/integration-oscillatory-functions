function [] = Besseldif()
%'a' and 'b' are the boundaries of the interval.
a=-1;
b=1;
% 'n' is the number of intervals. Here the interval is [-1;1] and will be
% divided by 500.
n=500;
% 'x' is the x-axis and must contain n+1 values when we divide a segment in
% n parts. For example if wr devid a segment in two parts, we need 3 values
% on the x axis |---|---| -> *x0*---*x1*---*x2*
x=zeros(1,n+1);
% 'D' will be the Chebyshev differentiation matrix
D=zeros(n+1,n+1);
% 'diag' will be a diagonal matrix
diag=zeros(n+1,n+1);
%The function f is constant, f=0.5 ont the interval [-1;1] and is represented 
%here by a simple vector.
f=0.5*ones(n+1,1);
% le paramètre 'p' est l'ordre de la fonction de Bessel
p=100;
%'J' est le vecteur contenant les valeurs de la fonction de bessel,
%ici de 80 à 130 et nous avons donc besoin de 51 valeurs
J=zeros(51); 
z=zeros(51);
% c=ones(n+1);
% c(1)=2;
%La boucle suivante construit la grille de Chebyshev sur l'interval [-1,1]
for s = 1 : n+1
x(s) = cos(pi*((s-1)/n));
end
%The following two loops consstruct the Chebychev differentiation matrix
% represented by 'D'
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
%Initialisation of the values on the corners of the differentiation matrix
D(1,1)=(1+(2*(n.^2)))/6;
D(n+1,n+1)=-(1+(2*(n.^2)))/6;
D(1,n+1)=0.5*((-1).^n);
D(n+1,1)=-0.5*((-1).^n);
%The following loop construct the diagonal matrix with the values of the 
%derivative of the function g, i.e. g'=d/dx (g).
for y=1:51
yy=y+79;
    for l=0:n
        diag(l+1,l+1)=pi*((yy*cos(pi*x(l+1)))-p);
    end
    %'B' is a matrix
    B=(D+(1i*diag));
    % 'f' is the vector that represent the function f and has been set at the
    % beginning of this script.
    % 'B\f' is used instead of 'inv(B)*f' as suggested by Matlab
    P=(B\f);
    J(y)=real((P(1)*exp(1i*(-p*pi)))-(P(n+1)*exp(1i*(p*pi))));
end
for kk=1:51
   z(kk)=kk;
end
plot(z+79,J)