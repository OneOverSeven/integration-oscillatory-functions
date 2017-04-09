function [result] = gprim(I, K, U, a, t)


result=I - K + U + (U*(sin(t/2)*1i +...
    cos(t/2)/a)^2)/(t*(1i/2) + 1/a)^2 +...
    (U*(sin(t/2)*1i + cos(t/2)/a)*((cos(t/2)*1i)/2 -...
    sin(t/2)/(2*a))*4*1i)/((t*1i)/2 + 1/a);