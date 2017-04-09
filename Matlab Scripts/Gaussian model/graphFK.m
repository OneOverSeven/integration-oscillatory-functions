function [] = graphFK()
a=27.2;
n=10;
pas=0.01;
t=0:pas:n;
y=0:pas:n;
for k=0:size(t)
   y(k+1)= exp(-1i*(FK(13.6,20,40,27.2,t(k+1))))*...
       ((pi/((1/a)+(1i*t(k+1)/2))).^(3/2));
end
plot(t,real(y));
hold all
plot(t,imag(y));

