ChebyMat := proc(n)
begin
local A := matrix(n,n);
for i from 1 to n do
  for j from 1 to n do
     A[i,j]:= orthpoly::chebyshev1(j-1, x[i-1]);
  end_for
end_for:
end_proc;
return A