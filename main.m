%%%%%%%%%%%%%%%% Path and Clears %%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;

addpath(genpath("curveFiles"))
% -- for some reason wont reckonize files if in subfolder,
% -- need to change at some point
addpath(genpath("fnc"))
addpath(genpath("fnc2"))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Read in blade profiles
% Set names
hubFile = "curveFiles/hub.curve";
shroudFile = "curveFiles/shroud.curve";
profileFile = "curveFiles/profile.curve";


%% Create hub, shroud, profile structures
[hubStrct, shroudStrct, superStrct] = defineProfileStrct(hubFile, shroudFile, profileFile);


%% Edit hub, shroud, profile structures
% for now singular change input
point = 'leading_edge';
angle_delta_value = -10; % shift blades 22.5deg for example nowz
[changedBladeStrct, changedHubStrct, changedShroudStrct] = changePitch(superStrct, angle_delta_value, point, hubStrct, shroudStrct)


%% Save
save('SAVED_DATA/plus.mat')

