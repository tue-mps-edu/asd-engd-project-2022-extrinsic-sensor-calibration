% this code takes folder of matlab figures of radar data and returns structure of
% filtered point cloud data with xyz coordinates and velocity
function [Yr, PCD2] = mmwcas_radpreproc(dist)

fprintf('Please select the directory of captured radar data\n');  % get the directory of captured radar data
myFolder = uigetdir;    
DataFiles = dir(fullfile(myFolder, '*.fig'));

for i = 1:length(DataFiles)   %extracts point cloud data from matlab figures
    str = fullfile(myFolder, DataFiles(i).name);
    fig = openfig(str,'invisible');
    axObjs = fig.Children;
    dataobjs = axObjs(3).Children;
    S = [];
    S = vertcat(S, dataobjs.XData);
    S = vertcat(S, dataobjs.YData);
    S = vertcat(S, dataobjs.ZData);
    S = vertcat(S, transpose(dataobjs.CData));
    str2 = sprintf('data%d',i);
    PCD.(str2) = transpose(S);
end

PCD2 = PCD;

for i = 1:length(DataFiles)  %removes points outside a input vicinity of the calibration target
  str2 = sprintf('data%d',i);
  filter1 = PCD.(str2)(:,2) >= (dist-1) & PCD.(str2)(:,2) <= (dist+0.5) & PCD.(str2)(:,1) >= -2 & PCD.(str2)(:,1) <= 2; 

  PCD.(str2) = PCD.(str2)(filter1,:);
end

% figure;
Yr = [];
for i = 1:length(DataFiles)    %find the cluster of points representing the calibration target
    str2 = sprintf('data%d',i);
    [idx, C] = kmeans(PCD.(str2), 2);

    if(C(1,3) > C(2,3))
        Yr = vertcat(Yr, C(1,1:3));
    else
        Yr = vertcat(Yr, C(2,1:3));
    end
end

% for i = 1:length(DataFiles)
%     subplot(2,2,i);
%     scatter3(PCD.(str2)(idx==1,1), PCD.(str2)(idx==1,2), PCD.(str2)(idx==1,3))
%     hold on
%     scatter3(PCD.(str2)(idx==2,1), PCD.(str2)(idx==2,2), PCD.(str2)(idx==2,3))
%     scatter3(C(:,1), C(:,2), C(:,3),'kx')
%     hold off
%     xlabel("x-axis");
%     ylabel("y-axis");
%     zlabel("z-axis");    
% end

Yr = Yr';

end




