function createBigImage(d,cStep,subfolder)
% Sweeps over a set of C values and create one image from all of their
% images
location = mfilename('fullpath');
filename = mfilename;
location = location(1:end-length(filename));
location=[location 'figures/' subfolder '/'];

bigMatrix = 0;
for cImag=-d:cStep:d
    thisRow = 0;
    for cReal=-d:cStep:d
        c = cReal + cImag*1i;
        % row
        [curImage,curMap] = imread([location sprintf('n=4  %.2f+%.2fi.png',real(c),imag(c))]);
        %curImage = ind2rgb(curImage,curMap);
        if (thisRow == 0)
            thisRow = curImage;
        else
            thisRow = [thisRow curImage];
        end
    end
    if (bigMatrix==0)
        bigMatrix = thisRow;
    else
        bigMatrix = [bigMatrix; thisRow;];
    end
end

imagesc(bigMatrix);
title('');
%colormap('copper');
axis equal
axis off

end