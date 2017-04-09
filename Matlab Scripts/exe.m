y=80;
n=100;
vec_a=computeVec_a(y,n);
pa=0;
pb=0;
for k=0:100
pa= pa + (vac_a(k+1)*mfun('T',k,-1));
pb= pb + (vac_a(k+1)*mfun('T',k,1));
end
J=(pb*exp(1i*(y*sin(1)))-(pa*exp(1i*(y*sin(-1)))));
real(J)