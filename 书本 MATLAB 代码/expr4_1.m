f = @func2;
a = 0;
b = pi / 2;
emg = 10^-5;
[x0, k] = demimethod(a, b, f, emg);
disp([x0, k]);
