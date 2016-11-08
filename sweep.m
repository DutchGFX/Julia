% Sweeps over a set of C values and generates images

clear
clear global
close all

%% Constants
powerN = 6;
iters = 50;
xcen = 0;
ycen = 0;
points = 2000;
cStep = .1;
d=1;
folder = 'N=6 High Res';
%% Function
for cReal=-1:cStep:1
    for cImag=-1:cStep:1
        c = cReal + cImag*1i;
        func = @(v) v.^powerN+c;
        escapeRadius = nthroot(2,powerN-1); %largest the escape radius could be
        kGrid = genKGrid(func,points,iters,escapeRadius,d);
        
        %% Plotting
        plotKGrid(kGrid,folder,c,jet.^3);
    end
end