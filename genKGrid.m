function [kGrid] = genKGrid(func,points,iters,escapeRadius,d)
%GENKGRID Generates the grid of K values, the iteration at which each point diverged 
%   Inputs: 
%           func: function for iteration
%           points: number of pixels in the image
%           iters: number of iterations
%           escapeRadius: radius for divergence
%           d: distance from origin to plot

xcen = 0;
ycen = 0;

%% Grid
x=linspace(xcen-d,xcen+d,points);
y=linspace(ycen-d,ycen+d,points);
[x,y]=meshgrid(x,y); %creates 2 matrices

kGrid = zeros(size(x)); % will store k values: dark not diverging
%% Calculations
z = x+1i.*y;
for iter=0:iters
    z=func(z); % next iteration
    escaped = abs(z)>escapeRadius; % particles that left the circle this iter
    z(escaped) = NaN; % prevent further iterations
    kGrid(escaped) = iter;
end

end

