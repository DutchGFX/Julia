clear
clear global
close all

%% Constants
goodCValues2 = [(-0.7+0.27015*1i) (0.285+0.01i)];
myGoodCValues2 = [0 (pi/8+pi/4*1i) (exp(-1)-exp(-2)*1i)];
myGoodCValues4 = [0 (pi/8)+(pi/3)*1i];
myGoodCValues6 = [(.9+(-.2)*1i) (.742+(-.11)*1i) (.755+(-.11)*1i) (.7+(-.09)*1i) (.8+(.4)*1i) (.8+(.3)*1i) (pi/3+-(.13333)*1i)];
myGoodCValues9 = [0 ((pi/8)+(pi/4)*1i) (.5-2*1i)];

powerN = 6;
iters = 100;
xcen = 0;
ycen = 0;
points = 2000;
d=2;

%% Function
theseC = eval((sprintf('myGoodCValues%g',powerN)));
c = theseC(1);
func = @(v) v.^powerN+c;

%% Grid
x=linspace(xcen-d,xcen+d,points);
y=linspace(ycen-d,ycen+d,points);
[x,y]=meshgrid(x,y); %creates 2 matrices

kGrid = zeros(size(x)); % will store k values: dark not diverging
%% Calculations
escapeRadius = nthroot(2,powerN-1); %largest the escape radius could be
z = x+1i.*y;
for iter=1:iters
    z=func(z); % next iteration
    escaped = abs(z)>escapeRadius; % particles that left the circle this iter
    z(escaped) = NaN; % prevent further iterations
    kGrid(escaped) = iter;
    
end

%% Plotting

figure1 = figure('Name','Julia Sets','NumberTitle','off');
imagesc([-4 4],[-4 4],kGrid)
colormap('copper')
titlee = sprintf('Julia Set of $Z^%g+C$ for $C = %.4f + %.4fi$',powerN,real(c),imag(c)); 
title(titlee,'Interpreter','latex')

axis equal
axis off
saveas(figure1,[pwd '\Julia Sets\figures\' sprintf('n=%g  %.4f+i%.4f',powerN,real(c),imag(c)) '.png']);

%increment c by .005