function [] = plotNewton(kGrid, powerN, c, colors)
%
%

figure1 = figure('Name','Julia Sets','NumberTitle','off');
imagesc([-4 4],[-4 4],kGrid)
colormap(colors) % parula,jet,hsv,hot,cool,spring,summer,autumn,winter,gray,bone,copper,pink,lines,colorcube,prism,flag
titlee = sprintf('Newton Fractl of $Z^%g+C$ for $C = %.4f + %.4fi$',powerN,real(c),imag(c));
title(titlee,'Interpreter','latex')
colorbar;
axis equal
axis off
%saveas(figure1,[pwd '\Julia Sets\figures\' sprintf('n=%g  %.4f+i%.4f',powerN,real(c),imag(c)) '.png']);

end

