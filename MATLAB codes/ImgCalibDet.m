function [lc, s, myFolder] = ImgCalibDet()

fprintf('Please select the directory of captured image data\n');  % get the directory of captured radar data
myFolder = uigetdir;    
DataFiles = dir(fullfile(myFolder, '*.jpg'));
s = size(DataFiles,1);

lc = [];
for i = 1:s  %extract centerpoint of the calibration target

    str = fullfile(myFolder, DataFiles(i).name);
    I = imread(str);
    I = rgb2gray(I);
    I = imsharpen(I,'Radius',0.5,'Amount',0.1);
    h = size(I,1);
    image_points = detectCheckerboardPoints(I);
    lc = vertcat(lc, mean(image_points, 1));

%     image_points = mean(image_points, 1);
%     J = insertText(I,image_points(:,:,1),1:size(image_points(:,:,1),1));
%     J = insertMarker(J, image_points(:,:,1), 'x-mark', 'Color', 'red', 'Size', 3);
%     figure;
%     imshow(J);
end

lc(:,2) = -(lc(:,2) - h);
lc = lc';

end