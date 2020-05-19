function [T, n] = bbct(f, a, b, eps)
    %f 表示被积函数句柄
    %a,b 被积区间端点
    %eps 精度
    %T 是用变步长梯形法求得的积分值
    %n 表示二分区间的次数
    h = b - a;
    fa = feval(f, a);
    fb = feval(f, b);
    T1 = h * (fa + fb) / 2;
    T2 = T1 / 2 + h * feval(f, a + h / 2) / 2;
    n = 1;
    %按变步长梯形法求积分值
    while abs(T2 - T1) >= eps
        h = h / 2;
        T1 = T2;
        S = 0;
        x = a + h / 2;

        while x < b
            fx = feval(f, x);
            S = S + fx;
            x = x + h;
        end

        T2 = T1 / 2 + S * h / 2;
        n = n + 1;
    end

    T = T2;