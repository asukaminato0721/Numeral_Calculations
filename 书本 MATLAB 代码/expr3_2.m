f = @f2; a = 0; b = 1; N = 10; ya = 1;
R = RungKutta4(f, a, b, N, ya);
y = solvef2(a:(b - a) / N:b);
m = [R, y'];
disp(m)