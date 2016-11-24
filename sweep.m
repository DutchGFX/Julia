% Sweeps over a set of C values and generates images

clear
clear global
close all

%% Constants
powerN = 4;
iters = 30;
points = 700; xcen = 0; ycen = 0; d=1;
tol = 10^(-6);
minc = -4; maxc = 4; cStep = .5;
a = 1.0 + 0.0i;
type = 'iterMap';
%folder = 'N=4 Newton';

newmap=jet(iters).^3;
indexOther = ceil(iters*.2);
for i=1:3
    newmap(1:indexOther+2,i) = linspace(0,newmap(indexOther,i),indexOther+2);
end

%% 
x = linspace(xcen-d,xcen+d,points);
y = linspace(ycen-d,ycen+d,points);
[x,y] = meshgrid(x,y); % creates 2 matrices
z = x+1i.*y;
z = x + 1i.*y;

for cReal=3:cStep:maxc
    for cImag=minc:cStep:maxc
        c = cReal + cImag*1i;
        
        [rootMap,iterMap] = newtonGrid(powerN,c,iters,z,a,tol);
        
        plotNewton(rootMap,iterMap,powerN,c,iters,a,newmap,type);
        %drawnow;
    end
end
