function[y0, N] = Lagrange_eval(X, Y, x0)
    %X,Y是已知插值点坐标
    %x0 是插值点
    %y0 是 Lagrange 插值多项式在 x0 处的值
    %N 是 Lagrange 插值函数的权系数
    m = length(X);
    N = zeros(m, 1);
    y0 = 0;

    for i = 1:m
        N(i) = 1;

        for j = 1:m

            if j ~= i;
                N(i) = N(i) * (x0 - X(j)) / (X(i) - X(j));
            end

        end

        y0 = y0 + Y(i) * N(i);
    end