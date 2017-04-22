function [result] = C2(alpha, t)
result=sin(t) - (2i*cos(t)/alpha) - (4*(sin(t/2).^2)/t)*(1+(2i/(t*alpha))) + 4i*sin(t)/(t*alpha);