%
%
%

powerN = 4;
iters = 50;
xcen = 0; ycen = 0; d = 1;
points = 500;

tol = 0.00001;
a = 1;  % scaling constant for relaxation

x = linspace(xcen-d,xcen+d,points);
y = linspace(ycen-d,ycen+d,points);
[x,y] = meshgrid(x,y); %creates 2 matricesc
z = x+1i.*y;

c = 0.1;

kGrid = newtonGrid(powerN, c, iters, z, a, tol);

colors = 'jet'; % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
plotNewton(kGrid, powerN, c, colors);
