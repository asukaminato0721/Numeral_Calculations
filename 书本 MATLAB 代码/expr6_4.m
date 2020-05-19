A = [0.3 * 10^-15, 59.14, 3, 1; 5.291, -6.13, -1, 2; 11.2, 9, 5, 2; 1, 2, 1, 1];
b = [59.17, 46.78, 1, 2]';


%Gauss列主元消去法:
disp('Gauss');

x = Gauss_pivot(A, b);

disp(x);
%Gauss消去法:
x = lu_decompose(A, b);
disp(x);
