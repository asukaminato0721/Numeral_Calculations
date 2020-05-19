function [x, k] = Mendnewton(f, x0, emg)
    %用牛顿下山法求解非线性方程
    %f 表示非线性方程
    %x0 是迭代初值，此方法是局部收敛，初值选择要恰当
    %emg 是精度指标
    %k,u 分别表示迭代次数和下山因子
    [f1, d1] = feval(f, x0); %d1 表示非线性方程 f 在 x0 处的导数值，以下类同
    k = 1;
    x(1) = x0;
    x(2) = x(1) - f1 / d1;

    while abs(f1) > emg%控制精度
        u = 1;
        k = k + 1;
        [f1, d1] = feval(f, x(k));
        x(k + 1) = x(k) - u * f1 / d1; %牛顿下山迭代
        [f2, d2] = feval(f, x(k + 1));

        while abs(f2) > abs(f1)%保证迭代后的函数值比迭代前的函数值小
            u = u / 2;
            x(k + 1) = x(k) - u * f1 / d1; %牛顿下山迭代
            [f2, d2] = feval(f, x(k + 1));
        end

    end
