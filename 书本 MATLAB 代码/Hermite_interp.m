function y0 = Hermite_interp(X, Y, DY, x0)
    %X,Y是已知插值点向量序列
    %DY是插值点处的导数值
    %x0 插值点横坐标
    %y0 为待求的分段三次 Hermite 插值多项式在 x0 处的值
    %N 向量长度
    N = length(X);

    for i = 1:N

        if x0 >= X(i) && x0 <= X(i + 1)
            k = i; break;
        end

    end

    a1 = x0 - X(k + 1);
    a2 = x0 - X(k);
    a3 = X(k) - X(k + 1);
    y0 = (a1 / a3)^2 * (1 - 2 * a2 / a3) * Y(k) + (-a2 / a3)^2 * (1 + 2 * a1 / a3) * Y(k + 1) +  (a1 / a3)^2 * a2 * DY(k) + (-a2 / a3)^2 * a1 * DY(k + 1);
