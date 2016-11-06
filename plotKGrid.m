function plotKGrid(kGrid,subfolder,c, colorMap, isPlot, func)
%PLOTKGRID Generates an image from the grid of k values
%   Inputs:
%           kGrid: grid of k values
%           subfolder: subfolder for saving images
%           c: c value, used for filename
%           colorMap: colormap to use. Default is copper
%           isPlot: boolean, true if plot displayed. Default false
%           func: used for labels in plotting

if (nargin<=4)
    isPlot=false;
end
if (nargin==3)
    colorMap = 'copper';
end

location = mfilename('fullpath');
filename = mfilename;
location = [location(1:end-length(filename)) '\figures\' subfolder '\'];

if (isPlot)
    figure1 = figure('Name','Julia Sets','NumberTitle','off');
    imagesc([-4 4],[-4 4],kGrid)
    colormap(colorMap)
    titlee = ['Julia Set for  ' func2str(func)];
    title(titlee,'Interpreter','latex')
    filenameToSave = [location sprintf('n=%g  %.4f+%.4fi',powerN,real(c),imag(c)) '.png'];
    axis equal
    axis off
    saveas(figure1,filenameToSave);
else
    filenameToSave = [location sprintf('%.4f+%.4fi',real(c),imag(c)) '.png'];
    newmap = copper(max(kGrid(:)));
    imwrite(kGrid,newmap,filenameToSave);
end

