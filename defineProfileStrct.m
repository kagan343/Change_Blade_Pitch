function [hub, shroud, superStrct] = defineProfileStrct(hubFile, shroudFile, profileFile)
    %% Defining profile set up
    % Shroud and Hub are basic #x3 files
    [hubX, hubY, hubZ] = readSimpleCurve(hubFile); % for graphing
    [shroudX, shroudY, shroudZ] = readSimpleCurve(shroudFile); % for graphing
    % Set up super structure
    hub.X = hubX; hub.Y = hubY; hub.Z = hubZ;
    shroud.X = shroudX; shroud.Y = shroudY; shroud.Z = shroudZ;
    superStrct.hub = hub;
    superStrct.shroud = shroud;
    
    % Profile needs seperate function to handle span lines
    profiles = readProfileCurves(profileFile);
    nProf = numel(profiles);
    
    %% Iterate through profile structure to define set up
    % x = radial, y = tangental, z = axial
    [angle_dictionary, avg_angle, angle_diff, cp_strct] = getProfileAngles(profiles)
    
    %% Set up profiles super sub structure
    subProfileStrct.profile = profiles;
    subProfileStrct.nProf = nProf;
    subProfileStrct.angle_dictionary = angle_dictionary;
    subProfileStrct.avg_angle = avg_angle;
    subProfileStrct.angle_diff = angle_diff;
    subProfileStrct.cp_strct = cp_strct;
    
    superStrct.subProfileStrct = subProfileStrct;
    
    
    
    
    
    
    
    
    % %% Edit
    % % for now singular change input
    % angle_delta_value = 45; % shift blades 45deg for example now
    % changedBladeStrct = changePitch()
    
    
    
    
    
    
    
    % %% Graph in 3D for visual
    % graphCurves(hubX, hubY, hubZ, shroudX, shroudY, shroudZ, nProf, profiles)
end