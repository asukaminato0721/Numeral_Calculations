function [x, k] = demimethod(a, b, f, emg)
    %a,b 表示求解区间 [a,b] 的端点
    %f 表示所求解方程德函数名
    %emg 是精度指标
    %x 表示所求近似解
    %k 表示循环次数
    fa = feval(f, a);
    fab = feval(f, (a + b) / 2);
    k = 0;

    while abs(b - a) > emg

        if fab == 0
            x = (a + b) / 2;
            return;
        elseif fa * fab < 0
            b = (a + b) / 2;
        else
            a = (a + b) / 2;
        end

        fa = feval(f, a);
        fab = feval(f, (a + b) / 2);
        k = k + 1;
    end

    x = (a + b) / 2;
