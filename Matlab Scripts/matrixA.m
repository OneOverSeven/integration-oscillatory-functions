function [A] = matrixA(n)
A=zeros(n+1,n+1);
c=ones(n+1);
c(1)=2;

for i = 0:n
    for j = 0:n
        if ((i<j)&&(mod((i+j),2)))
                A(i+1,j+1)=2*j/c(i+1);
        end
        
    end
end

