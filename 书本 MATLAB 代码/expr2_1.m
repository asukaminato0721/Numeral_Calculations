f = @f1; a = 0; b = 1;
N=64;
S = FSimpson(f, a, b, N);
disp(S)