function [x, k] = Fast_chord(f, x1, x2, emg)
    %用快速弦截法求解非线性方程
    %f 表示非线性方程函数
    %x1,x2 是迭代初值
    %emg 是精度指标
    %k 表示循环次数
    k = 1;
    y1 = feval(f, x1);
    y2 = feval(f, x2);
    x(k) = x2 - (x2 - x1) * y2 / (y2 - y1); %用快速弦截法进行迭代求解
    y(k) = feval(f, x(k));
    k = k + 1;
    x(k) = x(k - 1) - (x(k - 1) - x2) * y(k - 1) / (y(k - 1) - y2);

    while abs(x(k) - x(k - 1)) > emg%控制精度
        y(k) = feval(f, x(k));
        x(k + 1) = x(k) - (x(k) - x(k - 1)) * y(k) / (y(k) - y(k - 1));
        k = k + 1;
    end
