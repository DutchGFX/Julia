% newtonRun.m
% Sets parameters for and runs newtonGrid.m and plotNewton.m to generate
% images of Newton fractals for polynomials of the form: f(z) = z^n + c
%


%% set grid and image parameters

points = 800; % points = N, creates NxN grid
xcen = 0; ycen = 0; d = 1;  
x = linspace(xcen-d,xcen+d,points);
y = linspace(ycen-d,ycen+d,points);
[x,y] = meshgrid(x,y); % creates 2 matrices
z = x+1i.*y;

%% set Newton's method parameters

powerN = 3;      % polynomial degree
iters = 16;      % use ~10-20 for iterMapping, and >35ish for rootMapping
tol = 10^(-6);   % tolerance for convergence
a = 1 - 0.2i;      % scaling constant for relaxation variant
c = -3 + 0.5i;    % constant term in polynomial

[rootMap, iterMap] = newtonGrid(powerN, c, iters, z, a, tol);

%disp(kGrid);
%disp(iterMap);

%% plotting
close all;
colors = jet.^1; % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
plotNewton(rootMap, iterMap, powerN, c, iters, a, colors);
