X=[0.4,0.5,0.6];
Y=[-0.916,-0.693,-0.5108];
x0=0.54;
[y0, N] = Lagrange_eval(X,Y,x0);
disp('y0=')
disp(Lagrange_eval(X, Y, x0))
