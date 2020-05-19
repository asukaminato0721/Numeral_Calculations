f = @f1; a = 0; b = 1;
eps=0.001;
[quad, R] = Romberg(f, a, b, eps);
disp(quad)
