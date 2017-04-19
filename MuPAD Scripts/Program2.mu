Mprog := proc()
begin
A := matrix(3, 4):;
for i from 1 to 3 do
  for j from 1 to 4 do
    A[i, j] := i*j;
  end_for
end_for:
A
end_proc