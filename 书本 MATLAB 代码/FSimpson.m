function S = FSimpson(f, a, b, N)
    %f 表示被积函数句柄
    %a,b 表示被积区间端点
    %N 表示区间个数
    %S是用复化 Simpson 公式求得的积分值
    h = (b - a) / N;
    fa = feval(f, a);
    fb = feval(f, b);
    S = fa + fb;
    x = a;

    for i = 1:N
        x = x + h / 2;
        fx = feval(f, x);
        S = S + 4 * fx;
        x = x + h / 2;
        fx = feval(f, x);
        S = S + 2 * fx;
    end

    S = h * S / 6;
