function [] = plotNewton(rootMap,iterMap, powerN, c, iters, a, colors)
%
%


fig(1) = figure('Name','Julia Sets','NumberTitle','off');
imagesc([-4 4],[-4 4], iterMap);
colormap(fig(1),colors) % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
titlee = sprintf('Newton Fractal of $Z^%g+C$ for $C = %.4f + %.4fi$\n %d iterations, $a=%.4d+%.4di$ (Mapped by iterations)', ...
powerN,real(c),imag(c),iters,real(a),imag(a));
title(titlee,'Interpreter','latex')
colorbar;
axis equal;
axis off;
hold on;


%fig(2) = figure('Name','Julia Sets','NumberTitle','off');
% imagesc([-4 4],[-4 4],rootMap);
% colormap(fig(2),colors) % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
% titlee = sprintf('Newton Fractal of $Z^%g+C$ for $C = %.4f + %.4fi$\n %d iterations, $a=%.4d+%.4di$ (Mapped by root)' ...
% ,powerN,real(c),imag(c),iters,real(a),imag(a));
% title(titlee,'Interpreter','latex')
% colorbar;
% axis equal
% axis off;
%saveas(figure1,[pwd '\Julia Sets\figures\' sprintf('n=%g  %.4f+i%.4f',powerN,real(c),imag(c)) '.png']);



% attempted hybrid mapping

% grid = 10.*kGrid + iterMap;

% fig(3) = figure('Name','Julia Sets','NumberTitle','off');
% imagesc([-4 4],[-4 4], grid);
% colormap(fig(3),colors) % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
% titlee = sprintf('Newton Fractal of $Z^%g+C$ for $C = %.4f + %.4fi$ for %d iterations',powerN,real(c),imag(c),iters);
% title(titlee,'Interpreter','latex')
% colorbar;
% axis equal;
% axis off;

end

