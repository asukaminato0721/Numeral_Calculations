function A = Adams2PC(f, a, b, N, ya)
    %f 是微分方程右端函数句柄
    %a,b 是自变量的取值区间 [a,b]的端点
    %N 是区间等分的个数
    %ya表初值 y(a)
    %A=[x’,y’]是自变量 X 和解 Y 所组成的矩阵
    h = (b - a) / N;
    % x = zeros(1, N + 1);
    y = zeros(1, N + 1);
    x = a:h:b;
    y(1) = ya;

    for i = 1:N

        if i == 1
            y1 = y(i) + h * feval(f, x(i), y(i));
            y2 = y(i) + h * feval(f, x(i + 1), y1);
            y(i + 1) = (y1 + y2) / 2;
            dy1 = feval(f, x(i), y(i));
            dy2 = feval(f, x(i + 1), y(i + 1));
        else
            y(i + 1) = y(i) + h * (3 * dy2 - dy1) / 2;
            P = feval(f, x(i + 1), y(i + 1));
            y(i + 1) = y(i) + h * (P + dy2) / 2;
            dy1 = dy2;
            dy2 = feval(f, x(i + 1), y(i + 1));
        end

    end

    A=[x', y'];
