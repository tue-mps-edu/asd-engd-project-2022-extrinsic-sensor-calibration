
%% Camera Instrinsic Parameters

load('camera_intrinsic.mat');  %load camera intrinsic parameters
u0 = camera_intrinsic(5);  %  (u0, v0) = origin of pixel coordinates in pixels. value is (length/2, width/2)
v0 = camera_intrinsic(4);

dx = camera_intrinsic(2);  % (dx, dy) = pixel size in m.
dy = camera_intrinsic(3);

foc = camera_intrinsic(1); %focal length in m.

% ci = [foc 0 0 0; 0 foc 0 0; 0 0 1 0];   %camera to image transformation matrix
% ip = [1/dx 0 u0; 0 1/dy v0; 0 0 1];     %image to pixel transformation matrix

%% Extracting Locations of calibration target in radar and pixel data


dist = input('please enter the distance of calibration target from the radar\n');

[Yc, s, imagefolder] = ImgCalibDet();  % detecting location of target in image
Yc = vertcat(Yc, ones(1,s));

[Yr, PCD] = mmwcas_radpreproc(dist);   % detecting location of target in radar
Yr = vertcat(Yr, ones(1,s));
Yr(3,:) = Yr(3,:);


%% Find the extrinsic parameters of the radar-camera sensor system wrt camera


% x0 = [0 0 pi/2 0 0 0];
% [ext, cost] = Calib_Opt_Par(Yc, Yr, x0, camera_intrinsic);
% 
% for i = 1:50
%     a = (-pi + 2*pi*rand(1,6));
%     [b, fval] = Calib_Opt_Par(Yc, Yr, a, camera_intrinsic);
%     ext = vertcat(ext,b);
%     cost = vertcat(cost, fval);
% end
% 
% [mincost,Idx] = min(cost);
% opt_ext = ext(Idx,:);

x0 = [0 0 pi/2 0 0 0 foc u0 v0];
[ext, cost] = Calib_Opt_Fun_v2(Yc, Yr, x0);

for i = 1:50
    [ext, cost] = Calib_Opt_Fun_v2(Yc, Yr, ext);
end

opt_ext = ext;
mincost = cost;


%% find the spatial transformation matrices using the extrinsic parameters

% t = trvec2tform(opt_ext(4:6));
% r = rotm2tform(eul2rotm(opt_ext(1:3)));
% 
% Yrc = ci*t*r*Yr;
% Yrc = Yrc./Yrc(3,:);
% Yrc = ip*Yrc;
% 
% imgCalib_over(Yrc, imagefolder);

t = trvec2tform(opt_ext(4:6));
r = rotm2tform(eul2rotm(opt_ext(1:3)));
ci = [opt_ext(7) 0 0 0; 0 opt_ext(7) 0 0; 0 0 1 0];   %camera to image transformation matrix
ip = [1/dx 0 opt_ext(8); 0 1/dy opt_ext(9); 0 0 1];     %image to pixel transformation matrix

DataFiles = dir(fullfile(imagefolder, '*.jpg'));


for i = 1:size(DataFiles)

    str = fullfile(imagefolder, DataFiles(i).name);
    str2 = sprintf('data%d',i);

    rad = PCD.(str2);
    rad = rad';
    xyz = rad(1:3,:);
    xyz = vertcat(xyz, ones(1,size(rad,2)));
    xyz(3,:) = xyz(3,:);
    range = rad(2,:);

    Yrc = t*r*xyz;
    Yrc = Yrc./(Yrc(3,:));
    Yrc = ip*ci*Yrc; 
    %vel = rad(4,:);

    I = imread(str);
    h = size(I,1);
    p = Yrc;
    p(3,:) = [];
    p(2,:) = h - p(2,:);
    p = p';

    J = insertText(I,p,range);
    J = insertMarker(J, p, 'x-mark', 'Color', 'red', 'Size', 8);
    figure;
    imshow(J);

end

%%
