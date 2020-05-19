f = @f2;
a = 0;
b = 1;
N = 10;
ya = 1;
E = MendEuler(f, a, b, N, ya);
y = solvef2(a:(b - a) / N:b);
m = [E, y'];
disp(m)
