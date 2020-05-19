function y = Kaifang(a, eps, x0)
    %a 是被开方数
    %eps 是精度指标
    %x0 表示初值
    %y 是 a 的开方
   % x=zeros(1:1000); 因为不知道要循环多少次，所以不能提前初始化
    x(1) = x0;
    x(2) = (x(1) + a / x(1)) / 2;
    k = 2;

    while abs(x(k) - x(k - 1)) > eps
        x(k + 1) = (x(k) + a / x(k)) / 2;
        k = k + 1;
    end

    y = x';
