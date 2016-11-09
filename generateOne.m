clear
clear global
close all

powerN = 6;
iters = 500;
xcen = 0;
ycen = 0;
points = 5;
d=1.2;

%% Function
c = rand(1)+rand(1)*1i;
%c = 0.7000 - 0.0900i;
func = @(v) v.^powerN+c;
escapeRadius = nthroot(2,powerN-1);
%%
kGrid = genKGrid(func,points,iters,escapeRadius,d);
plotKGrid(kGrid,'myImages\Ultra High Res',c,1, '')