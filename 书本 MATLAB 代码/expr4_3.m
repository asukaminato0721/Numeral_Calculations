f = @func3;
x0 = 2.0;
[x, k] = Mendnewton(f, x0, 10^-6);
disp([x, k]);
