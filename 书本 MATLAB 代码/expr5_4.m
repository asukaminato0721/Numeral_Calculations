A = [4, -1, 0; -1, 4, -1; 0, -1, 4];
b = [1, 4, -3]';
x0 = [0, 0, 0]';

[x1, k1] = SORmethod(A, b, x0, 100, 10^-5, 1.2);
[x2, k2] = SSORmethod(A, b, x0, 100, 10^-5, 1.2);

disp(x1)
disp(k1)
disp(x2)
disp(k2)
