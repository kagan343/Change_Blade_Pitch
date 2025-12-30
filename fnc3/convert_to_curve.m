function convert_to_curve(changedBladeStrct, changedHubStrct, changedShroudStrct, angle)
% Take .mat files from change_blade_pitch and convert back into
% .curve files for the ansys batch scripts

    %%%% USER INPUTS: output directory and file names%%%%
    % Set output folder and filenames
    % outDir = 'C:\Users\kagan\Documents\GitHub\Convert_to_curve\temp_curve_save';
    outDir = 'C:\Users\kagan\Desktop_v2\Projects-Tutorials\Minature TurboJet\Prototype_v2\ANSYS\Batch Run\temp_file_load';
    % For now keep names as "scaled_*.curve" as this is what batch files read
    hubOut     = fullfile(outDir, 'scaled_hub.curve');
    shroudOut  = fullfile(outDir, 'scaled_shroud.curve');
    profileOut = fullfile(outDir, 'scaled_profile.curve');
    %%%% END USER INPUTS %%%%
    
    %% Write HUB and Shroud (8 decimal output for now)
    writeCurveXYZ(hubOut, changedHubStrct.X, changedHubStrct.Y, changedHubStrct.Z, 8);
    writeCurveXYZ(shroudOut, changedShroudStrct.X, changedShroudStrct.Y, changedShroudStrct.Z, 8);
    
    %% Write Profiles (multiple spans)
    N = numel(changedBladeStrct); % Grab number of fields from strct
    spanPercents = linspace(0, 100, N); % Set number of spans via # of fields
    writeProfileCurve(profileOut, changedBladeStrct, spanPercents);
    % fprintf("Wrote:\n  %s\n  %s\n  %s\n", hubOut, shroudOut, profileOut);

    
    
    % Save again to permanent folder so have trace
    %%%% USER INPUTS: output directory and file names%%%%
    % Set output folder and filenames
    % outDir = 'C:\Users\kagan\Documents\GitHub\Convert_to_curve\temp_curve_save';
    outDir = 'C:\Users\kagan\Documents\GitHub\Convert_to_curve\temp_curve_save';
    % For now keep names as "scaled_*.curve" as this is what batch files read
    filename_base = sprintf('%.3f_scaled', angle);
    hubOut     = fullfile(outDir, [filename_base, '_hub.curve']);
    shroudOut  = fullfile(outDir, [filename_base, '_shroud.curve']);
    profileOut = fullfile(outDir, [filename_base, '_profile.curve']);
    %%%% END USER INPUTS %%%%
    
    %% Write HUB and Shroud (8 decimal output for now)
    writeCurveXYZ(hubOut, changedHubStrct.X, changedHubStrct.Y, changedHubStrct.Z, 8);
    writeCurveXYZ(shroudOut, changedShroudStrct.X, changedShroudStrct.Y, changedShroudStrct.Z, 8);
    
    %% Write Profiles (multiple spans)
    N = numel(changedBladeStrct); % Grab number of fields from strct
    spanPercents = linspace(0, 100, N); % Set number of spans via # of fields
    writeProfileCurve(profileOut, changedBladeStrct, spanPercents);
    % fprintf("Wrote:\n  %s\n  %s\n  %s\n", hubOut, shroudOut, profileOut);

end

