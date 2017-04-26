function [result] = FK2(I,U,K,a,t)
result=((I+U-K)*t)-...
    (2i*U/a)-...
    (((4*U*(sin(t/2).^2))/(t))*(1+(2i/(a*t))))+...
    (4i*U*sin(t)/(a*t));