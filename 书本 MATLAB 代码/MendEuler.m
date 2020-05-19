function E = MendEuler(f, a, b, N, ya)
    %f是微分方程右端函数句柄
    %a,b是自变量的取值区间[a,b]的端点
    %N是区间等分的个数
    %ya表初值y(a)
    %E=[x’,y’]是自变量X和解Y所组成的矩阵
    h = (b - a) / N;
    y = zeros(1, N + 1);
    % x = zeros(1, N + 1);
    y(1) = ya;
    x = a:h:b;

    for i = 1:N
        y1 = y(i) + h * feval(f, x(i), y(i));
        y2 = y(i) + h * feval(f, x(i + 1), y1);
        y(i + 1) = (y1 + y2) / 2;
    end

    E = [x', y'];
