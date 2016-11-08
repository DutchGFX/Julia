% newtonRun.m
% Sets parameters for and runs newtonGrid.m and plotNewton.m to generate
% images of Newton fractals for polynomials of the form: f(z) = z^n + c
%

close all;
%% set grid and image parameters

points = 700; % points = N, creates NxN grid
xcen = 0; ycen = 0; d = 1;  
x = linspace(xcen-d,xcen+d,points);
y = linspace(ycen-d,ycen+d,points);
[x,y] = meshgrid(x,y); % creates 2 matrices
z = x+1i.*y;

%% set Newton's method parameters

powerN = 5;      % polynomial degree
iters = 40;      % use ~10-20 for iterMapping, and >35ish for rootMapping
tol = 10^(-6);   % tolerance for convergence
a = 1.0 + 0.0i;  % scaling constant for relaxation 0(stable inside disk of r=1, centered at 1)
c = -1.0 + 0.0i;    % constant term in polynomial

[rootMap, iterMap] = newtonGrid(powerN, c, iters, z, a, tol);

%disp(rootMap);
%disp(iterMap);

%% plotting
% parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag

type = 'iterMap';
%type = 'rootMap';
%type = 'both';

colors = max(iterMap(:));

%newmap = copper(max(iterMap(:)));
%newmap = rand(max(iterMap(:)),3);
newmap=jet(colors).^3;
indexOther = ceil(colors*.2);

for i=1:3
    newmap(1:indexOther+2,i) = linspace(0,newmap(indexOther,i),indexOther+2);
end

plotNewton(rootMap,iterMap,powerN,c,iters,a,newmap,type);
