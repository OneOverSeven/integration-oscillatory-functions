%Matrice de différentiation

function [] = integral()
I=13.6;
U=20;
alpha=2*I;

a=0;
b=8*pi;
n=2000;
t=zeros(1,n+1);
D=zeros(n+1,n+1);
diag=zeros(n+1,n+1);
lambda=(b-a)/2;
vecf=zeros(n+1,1);
x=zeros(100); %le vecteur contenant les valeurs de la fonction de besselici de 80 à 130

for s = 1 : n+1
t(s) = lambda*cos(pi*((s-1)/n)) + (b+a)/2;
end

for j = 1:n-1
    for k = 1:n-1
        D(j+1,k+1) = ((-1).^(k+j))/(t(j+1)-t(k+1));
    end
end

for k = 1:n-1
    
        D(k+1,k+1) = (-0.5)*(t(k+1)/(1-(t(k+1).^2)));
        D(1,k+1) = 2*((-1).^k)/(1-t(k+1));
        D(k+1,1) = (-0.5)*((-1).^k)/(1-t(k+1));
        D(k+1,n+1) = (0.5)*((-1).^(n+k))/(1+t(k+1));
        D(n+1,k+1) = (-2)*((-1).^(n+k))/(1+t(k+1));
end
D(1,1)=(1+(2*(n.^2)))/6;
D(n+1,n+1)=-(1+(2*(n.^2)))/6;
D(1,n+1)=0.5*((-1).^n);
D(n+1,1)=-0.5*((-1).^n);

for K=5:50
%P=zeros(n+1,1);
    for l=0:n
        diag(l+1,l+1)=gprim(I, K, U, alpha, t(l+1));
        vecf(l+1)=f(U,K,alpha,t(l+1));
    end
    B=(D+(1i*lambda*diag));
    P=(B\(lambda*vecf));
    x(K)=norm((sqrt(1))*((P(1)*exp(-1i*(g(I, K, U, alpha, b))))-(P(n+1)*exp(-1i*(g(I, K, U, alpha, a))))));
end
semilogy(1:100, x,'-ko','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',7)
