%% prepare and start.

% 默认的初始设置无需改动
clear all;
false = 0;
true = 1;

% HFSS执行路径
hfssExePath = 'D:\ProgramFiles\AnsysEM\AnsysEM19.4\Win64\reg_ansysedt.exe';

% 临时文件路径，请按系统路径改动【必填】
tmpPrjFile = 'F:\Documents\AnsysEM\Ansoft\my_cylinder\my_cylinder.aedt'; % 【工程名】
% tmpDataFile = 'E:\ansoft\temp\tmpData.m';
tmpScriptFile = 'F:\Documents\AnsysEM\Ansoft\my_cylinder\my_cylinder.vbs'; %【脚本名】

% 创建一个新的HFSS临时脚本文件
fid = fopen(tmpScriptFile, 'wt'); % 'wt'表示以文本模式打开文件，可写，覆盖原有内容 

% 创建一个新的工程并插入一个新的设计
hfssNewProject(fid);
hfssInsertDesign(fid, 'cylinder_test'); % 【设计名】

%% 参数预置

% 圆柱体尺寸
r = 0.5; % 半径
h = 1.0; % 高度

%% do the design

	% 创建圆柱体
	hfssCylinder(fid, 'Cylinder', 'Z', [0, 0, 0], r, h, 'mm');
    
%% save and close the design

% 保存工程到临时文件夹
hfssSaveProject(fid, tmpPrjFile, true);

% 关闭HFSS脚本文件
fclose(fid);