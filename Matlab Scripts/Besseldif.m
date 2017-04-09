function [] = Besseldif()
a=-1;
b=1;
% 'n' is the number of intervals. Here the interval is [-pi;pi] and will be
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
%The function f is constant, f=0.5 on the interval [-1;1] and is 
%represented here by a simple vector.
f=0.5*ones(n+1,1);
% 'h' is the order of the Bessel function
h=100;
% and we compute the Bessel function from z1=80 to z2=130
z1=80;
z2=130;
% 'm' divide the interval on which we compute the Bessel function
m=200;
%'J' is a vector that contain the values of the Bessel function
J=zeros(m+1);
%The following loop construct the Chebyshev nodes/grid (or Gauss-Lobatto 
%nodes) on the interval [a,b] 
%see https://en.wikipedia.org/wiki/Chebyshev_nodes
%and https://en.wikipedia.org/wiki/Chebyshev_polynomials#Roots_and_extrema
for s = 0:n
x(s+1) = ((b-a)/2)*cos((s/n)*pi)+((b+a)/2);
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

for k=0:m
z=z1+((k/m)*(z2-z1));
    for l=0:n
        diag(l+1,l+1)=pi*((z*cos(pi*x(l+1)))-h);
    end
    %'B' is a matrix
    B=(D+(1i*diag));
    % 'f' is the vector that represent the function f and has been set at 
    % the beginning of this script.
    % 'B\f' is used instead of 'inv(B)*f' as suggested by Matlab
    P=(B\f);
    J(k+1)=real( (P(1)*exp(-1i*h*pi))-(P(n+1)*exp(1i*((h*pi)))) );
end

w=80:((z2-z1)/m):130;
plot(w,J)
title('The Bessel function of order 100');
xlabel('z');
ylabel('B_{100}(z)');
grid on

