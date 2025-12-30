function main(angle_delta_value)

    % Paths
    % clc;
    % clear all;
    
    addpath(genpath("curveFiles"))
    addpath(genpath("fnc"))
    addpath(genpath("fnc2"))
    addpath(genpath("fnc3"))
    
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
    %angle_delta_value = 0; % shift blades 22.5deg for example nowz
    [changedBladeStrct, changedHubStrct, changedShroudStrct] = changePitch(superStrct, angle_delta_value, point, hubStrct, shroudStrct);
    
    %% Write to batch file location
    convert_to_curve(changedBladeStrct, changedHubStrct, changedShroudStrct, angle_delta_value)

end

