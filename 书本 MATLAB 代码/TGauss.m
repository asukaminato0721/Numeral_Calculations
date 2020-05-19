function G = TGauss(f, a, b)
    %f 表示被积函数句柄
    %a,b 被积区间端点
    %G是用三点 Gauss公式求得的积分值
    x1 = (a + b) / 2 - sqrt(3/5) * (b - a) / 2;
    x2 = (a + b) / 2 + sqrt(3/5) * (b - a) / 2;
    G = (b - a) * (5 * feval(f, x1) / 9 + 8 * feval(f, (a + b) / 2) / 9 + 5 * feval(f, x2) / 9) / 2;