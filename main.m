clc;
clear all;

addpath(genpath("curveFiles"))
% -- for some reason wont reckonize files if in subfolder,
% -- need to change at some point
addpath(genpath("fnc"))
addpath(genpath("fnc2"))


%% Read in blade profiles

% Set names
hubFile = "curveFiles/hub.curve";
shroudFile = "curveFiles/shroud.curve";
profileFile = "curveFiles/profile.curve";

%% Create profile structure
superStrct = defineProfileStrct(hubFile, shroudFile, profileFile);

%% Edit strucutre
% for now singular change input
point = 'leading_edge';
angle_delta_value = 22.5; % shift blades 45deg for example now
changedBladeStrct = changePitch(superStrct, angle_delta_value, point)