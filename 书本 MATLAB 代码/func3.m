function [f, d] = func3(x)
    f = sqrt(x.^2 + 1) - tan(x);
    syms y;
    d1 = sqrt(y^2 + 1) - tan(y);
    d = subs(diff(d1),y,x); %对函数 f 求一次导数
