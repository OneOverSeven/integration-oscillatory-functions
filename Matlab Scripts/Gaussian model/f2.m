function[result] = f2(U, K, a, t)
z=U*C2(a,t);
result = ...
    ((U/(pi*a)).^(1.5))*...
    (2*(1i^(K+1))/(a.^2))*...
    ((pi/((1/a)+(1i*t/2))).^(3/2))*...
    (...
    B2(t)*besselj(K+2,z)+...
    (1i*((B2(t)*exp(1i*t))+D2(t))*besselj(K+1,z))+...
    ((B2(t)+(D2(t)*exp(1i*t)))*besselj(K,z))-...
    (1i*B2(t)*exp(1i*t)*besselj(K-1,z))...
    );