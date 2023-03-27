function PCD = getpcddat(myFolder)

%myFolder = 'C:\Users\20225507\Documents\MATLAB\Radar';
DataFiles = dir(fullfile(myFolder, '*.fig'));

str = fullfile(myFolder, DataFiles(1).name);
fig = openfig(str,'invisible');
axObjs = fig.Children;
dataobjs = axObjs(3).Children;
S = [];
S = vertcat(S, dataobjs.XData);
S = vertcat(S, dataobjs.YData);
S = vertcat(S, dataobjs.ZData);
S = vertcat(S, transpose(dataobjs.CData));

PCD = S;

end
