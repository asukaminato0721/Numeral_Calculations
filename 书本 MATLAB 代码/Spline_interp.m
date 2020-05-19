function [y0, C] = Spline_interp(X, Y, s0, sN, x0)
    %X,Y是已知插值坐标
    %s0,sN是两端点的一次导数值
    %x0 是插值点
    %y0 三次样条函数在 x0 处的值
    %C是分段三次样条函数的系数
    N = length(X);
    C = zeros(4, N - 1);
    %   h = zeros(1, N - 1);
    mu = zeros(1, N - 1);
    lmt = zeros(1, N - 1);
    d = zeros(1, N);
    h = X(1, 2:N) - X(1, 1:N - 1);
    mu(1, N - 1) = 1;
    lmt(1, 1) = 1;
    mu(1, 1:N - 2) = h(1, 1:N - 2) ./ (h(1, 1:N - 2) + h(1, 2:N - 1));
    lmt(1, 2:N - 1) = h(1, 2:N - 1) ./ (h(1, 1:N - 2) + h(1, 2:N - 1));
    d(1, 1) = 6 * ((Y(1, 2) - Y(1, 1)) / h(1, 1) - s0) / h(1, 1);
    d(1, N) = 6 * (sN - (Y(1, N) - Y(1, N - 1)) / h(1, N - 1)) / h(1, N - 1);
    d(1, 2:N - 1) = 6 * ((Y(1, 3:N) - Y(1, 2:N - 1)) ./ h(1, 2:N - 1) - (Y(1, 2:N - 1) - Y(1, 1:N - 2)) ./ h(1, 1:N - 2)) ./ (h(1, 1:N - 2) + h(1, 2:N - 1));
    %追赶法解三对角方程组
    bit = zeros(1, N - 1);
    bit(1, 1) = lmt(1, 1) / 2;

    for i = 2:N - 1
        bit(1, i) = lmt(1, i) / (2 - mu(1, i - 1) * bit(1, i - 1));
    end

    y = zeros(1, N);
    y(1, 1) = d(1, 1) / 2;

    for i = 2:N
        y(1, i) = (d(1, i) - mu(1, i - 1) * y(1, i - 1)) / (2 - mu(1, i - 1) * bit(1, i - 1));
    end

    x = zeros(1, N);
    x(1, N) = y(1, N);

    for i = N - 1:-1:1
        x(1, i) = y(1, i) - bit(1, i) * x(1, i + 1);
    end

    v = zeros(1, N - 1);
    v(1, 1:N - 1) = (Y(1, 2:N) - Y(1, 1:N - 1)) ./ h(1, 1:N - 1);
    C(4, :) = Y(1, 1:N - 1);
    C(3, :) = v - h .* (2 * x(1, 1:N - 1) + x(1, 2:N)) / 6;
    C(2, :) = x(1, 1:N - 1) / 2;
    C(1, :) = (x(1, 2:N) - x(1, 1:N - 1)) ./ (6 * h);

    if nargin < 5
        y0 = 0;
    else

        for j = 1:N - 1

            if x0 >= X(1, j) && x0 < X(1, j + 1)
                omg = x0 - X(1, j);
                y0 = ((C(4, j) * omg + C(3, j))*omg + C(2, j)) * omg + C(1, j);
            end

        end

    end
