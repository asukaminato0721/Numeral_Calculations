X=[0.3,0.4,0.5,0.6];
Y=log(X);
DY=1./X;
x0=0.45;
y0 = Hermite_interp(X,Y,DY,x0);
disp(y0)