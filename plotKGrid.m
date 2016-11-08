function plotKGrid(kGrid,subfolder,c, isPlot, funcString)
%PLOTKGRID Generates an image from the grid of k values
%   Inputs:
%           kGrid: grid of k values
%           subfolder: subfolder for saving images
%           c: c value, used for filename
%           isPlot: boolean, true if plot displayed. Default false
%           funcString: used for labels in plotting

if (nargin<=4)
    isPlot=false;
end

offByOne = false;

location = mfilename('fullpath');
filename = mfilename;
location = [location(1:end-length(filename)) '\figures\' subfolder '\'];

colors = max(kGrid(:));

%% Custom Colormap by making JET slightly darker
newmap = copper(max(kGrid(:)));
%newmap = rand(max(kGrid(:)),3);
newmap=jet(colors).^3;
indexOther = ceil(colors*.2);
for i=1:3
    newmap(1:indexOther+2,i) = linspace(0,newmap(indexOther,i),indexOther+2);
end
    
%% Fancy Plotting?
if (offByOne)
   kGrid=kGrid-1;
   kGrid(kGrid<0)=0;
end

%% Plot Display
if (isPlot)
    figure1 = figure('Name','Julia Sets','NumberTitle','off');
    imagesc([-4 4],[-4 4],kGrid)
    colormap(newmap)
    titlee = ['Julia Set for  ' funcString sprintf('%.4f+%.4fi',real(c),imag(c))];
    title(titlee,'Interpreter','latex')
    %filenameToSave = [location sprintf('n=%g  %.4f+%.4fi',powerN,real(c),imag(c)) '.png'];
    axis equal
    axis off
    %saveas(figure1,filenameToSave);
else
    filenameToSave = [location sprintf('%.4f+%.4fi',real(c),imag(c)) '.png'];
    imwrite(kGrid,newmap,filenameToSave);
end

