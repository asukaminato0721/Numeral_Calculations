A = [4, -2, 4; -2, 17, 10; 4, 10, 9];
b = [8.7, 13.7, -0.7];

x = Chol_decompose(A, b);

disp(x)
