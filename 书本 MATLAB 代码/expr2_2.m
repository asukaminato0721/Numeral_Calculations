f = @f1; a = 0; b = 1;
eps=0.0001;
[T, n] = bbct(f, a, b, eps);
disp(T);