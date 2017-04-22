xmin=0;
xmax=15;

K=1;

I=13.6;
U=20;
a=2*I;

x=0:0.01:xmax;
y=zeros(length(x));

for j=1:length(x)
    %y(j)=real(f2(U,K,a,x(j)));
    y(j)=real(f2(U,K,a,x(j))*exp(-1i*FK2(I,U,K,a,x(j))));
end

plot(x,y,'b');
title(['Imaginary part f(x) pour K=' num2str(K) ', I_P =' num2str(I) ', U_P=' num2str(U) ', et \alpha= 2I_P' ]);
xlabel('x');
ylabel('y');
xlim([xmin xmax])
grid on
legend('Imaginary part f(x)')