clc;
clear all;
close all;

filePath = 'ImagesData/';
directories = dir(filePath);
NORMALIZE_IMAGE = true;
mkdir('newImagesData');
for dirIndex=1:length(directories)
    
    currentdir = directories(dirIndex).name;
    disp(currentdir);
    if (length(currentdir)>3)
        currentpath=[filePath currentdir];
        cd newImagesData\
        mkdir(currentdir);
        cd ..
        newcurrentpath=['newImagesData/' currentdir];
        currentdir = dir(currentpath);
        for fileIndex=1:length(currentdir)
            currentFilename = currentdir(fileIndex).name;
            disp(currentFilename);
            if (length(currentFilename)>4) && strcmp(currentFilename(end-3:end),'.jpg')
                imageFullPath = [currentpath '/' currentFilename];
                newimageFullPath = [newcurrentpath '/' currentFilename];
                I = imread(imageFullPath);
  
        if ~isempty(whos('I'))
            [imageX,imageY,imageDepth] = size(I);
            if NORMALIZE_IMAGE
                % Resize the image to 320*240
                imageSize = 320;
                if imageX>=imageY
                    resizedImageY = round(imageY/imageX*imageSize);
                    I = imresize(I,[imageSize,resizedImageY]);
                else
                    resizedImageX = round(imageX/imageY*imageSize);
                    I = imresize(I,[resizedImageX,imageSize]);
                end
                sname=strcat(newimageFullPath(1:end-4),'.jpg');
%                     partname=strcat('part',num2str(i));
%                     varname = genvarname(partname);
                    imwrite(I,sname);
            end
        end
            end
        end
    end
end
