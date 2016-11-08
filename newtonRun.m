% newtonRun.m
% Sets parameters for and runs newtonGrid.m and plotNewton.m to generate
% images of Newton fractals for polynomials of the form: f(z) = z^n + c
%


%% set grid and image parameters

points = 1000; % points = N, creates NxN grid
xcen = 0; ycen = 0; d = 1;  
x = linspace(xcen-d,xcen+d,points);
y = linspace(ycen-d,ycen+d,points);
[x,y] = meshgrid(x,y); % creates 2 matrices
z = x+1i.*y;

%% set Newton's method parameters

powerN = 3;     % degree of polynomial 
iters = 30;     % iterations for running Newton's method
tol = 0.000001; % tolerance for convergence
a = 1;          % scaling constant for relaxation variant
c = -1 - 0i;    % constant term in polynomial

kGrid = newtonGrid(powerN, c, iters, z, a, tol);

%% plotting
close all;
colors = hsv.^1; % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
plotNewton(kGrid, powerN, c, iters, colors);
