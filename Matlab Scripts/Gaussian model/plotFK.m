I=13.6;
U=20;
% K=5:1:50;
% K=5;

x=0:1:100;
y1=zeros(length(x));
y2=zeros(length(x));
  
for K=10:30:310
for k=0:length(x)-1
     y1(k+1)=real(FK(I,U,K,2*I,k/length(x)));
     y2(k+1)=imag(FK(I,U,K,2*I,k/length(x)));

end
plot(x,y1)
plot(x,y2)
hold all
end
