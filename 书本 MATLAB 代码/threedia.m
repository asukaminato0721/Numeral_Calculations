function x = threedia(a, b, c, f)
    %求解线性方程组 Ax=f，其中 A 是三对角阵
    %a 是矩阵 A 的下对角线元素 a(1)=0
    %b 是矩阵 A 的对角线元素
    %c 是矩阵 A 的上对角线元素 c(N)=0
    %f 是方程组的右端向量
    N = length(f);
    x = zeros(1, N); y = zeros(1, N);
    d = zeros(1, N); u = zeros(1, N);
    %预处理
    d(1) = b(1);

    for i = 1:N - 1
        u(i) = c(i) / d(i);
        d(i + 1) = b(i + 1) - a(i + 1) * u(i);
    end

    %追的过程
    y(1) = f(1) / d(1);

    for i = 2:N
        y(i) = (f(i) - a(i) * y(i - 1)) / d(i);
    end

    %赶的过程
    x(N) = y(N);

    for i = N - 1:-1:1
        x(i) = y(i) - u(i) * x(i + 1);

    end
