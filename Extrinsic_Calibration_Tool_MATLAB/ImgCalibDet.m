function [lc, s, myFolder] = ImgCalibDet()

fprintf('Please select the directory of captured image data\n');  % get the directory of captured radar data
myFolder = uigetdir;    
DataFiles = dir(fullfile(myFolder, '*.jpg'));
s = size(DataFiles,1);

fprintf('Processing Image Data....\n');

lc = [];
for i = 1:s  %extract centerpoint of the calibration target
    str = fullfile(myFolder, DataFiles(i).name);
    I = imread(str);
    I = rgb2gray(I);
    h = size(I,1);
    image_points = detectCheckerboardPoints(I);
    lc = vertcat(lc, mean(image_points, 1));
end

lc(:,2) = -(lc(:,2) - h);
lc = lc';
fprintf('Image Processing Complete\n');
end