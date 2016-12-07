function [] = plotNewton(rootMap,iterMap,powerN,c,iters,a,colors,type)
% plotNewton.m
% plots Newton fractals
% parameters:
%   rootMap- maps a starting point to the root where it converged
%   iterMap- maps a starting point to the # of iterations for convergence
%   powerN- degree of polynomial, Z^n + c 
%   c- coplex constant term in polynomial
%   iters- # of iterations 
%   a-
%   colors- color scheme for plot
%   type- 'rootMap'm 'iterMap', or 'both' (which ones gets plotted)

if (strcmp(type,'iterMap') || strcmp(type,'both'))
    fig(1) = figure('Name','Julia Sets','NumberTitle','off');
    imagesc([-4 4],[-4 4], iterMap);
    colormap(fig(1),colors) % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
    titlee = sprintf('Newton Fractal of $Z^%g+C$ for $C = %.4g + %.4gi$\n %d iterations, $a=%.4g+%.4gi$ (Mapped by iterations)', ...
    powerN,real(c),imag(c),iters,real(a),imag(a));
    title(titlee,'Interpreter','latex')
    colorbar;
    axis equal;
    axis off;
    hold on;
    saveas(fig(1),[pwd '\figures\Newton\' sprintf('n=%g  %.2f+%.2fi',powerN,real(c),imag(c)) '.png']);
    %saveas(fig(1),[pwd '\Julia Sets\figures\' sprintf('n=%g  %.4f+i%.4f',powerN,real(c),imag(c)) '.png']);
end

if (strcmp(type,'rootMap') || strcmp(type,'both'))
    fig(2) = figure('Name','Julia Sets','NumberTitle','off');
    imagesc([-4 4],[-4 4],rootMap);
    colormap(fig(2),colors) % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
    titlee = sprintf('Newton Fractal of $Z^%g+C$ for $C = %.4f + %.4fi$\n %d iterations, $a=%.4g+%.4gi$ (Mapped by root)' ...
    ,powerN,real(c),imag(c),iters,real(a),imag(a));
    title(titlee,'Interpreter','latex')
    colorbar;
    axis equal
    axis off;
    %saveas(fig(2),[pwd '\Julia\figures\realTime\' sprintf('n=%g  %.4f+%.4fi',powerN,real(c),imag(c)) '.png']);
end


% Attempted hybrid mapping
% use some weighted combination of rootMap and iterMap

% grid = 10.*rootMap + iterMap;

% fig(3) = figure('Name','Julia Sets','NumberTitle','off');
% imagesc([-4 4],[-4 4], grid);
% colormap(fig(3),colors) % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
% titlee = sprintf('Newton Fractal of $Z^%g+C$ for $C = %.4f + %.4fi$ for %d iterations',powerN,real(c),imag(c),iters);
% title(titlee,'Interpreter','latex')
% colorbar;
% axis equal;
% axis off;

end

