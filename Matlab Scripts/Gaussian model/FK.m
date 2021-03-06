function [result] = FK(I,U,K,a,t)
result=((I+U-K)*t)-...
    (2i*U/a)+...
    (...
    (2i*U/((1/a)+(1i*t/2)))*...
    (((cos(t/2)/a)+(1i*sin(t/2))).^2)...
    );
