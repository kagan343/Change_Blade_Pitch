function changedBladeStrct = changeViaLead(profile_strc, angle_delta_value)

    % Set angle for zeroing, angle = leading edge angle
    %zero_angle = cp_strct.leading_angle;
    
    % Create copy of profile_strc
    changedBladeStrct = profile_strc;

    % Iterate over each element in profile
    for n = 1:numel(profile_strc)
        current_row = profile_strc(n); % Grab current row in strc
        [changedBladeStrct(n).Z, changedBladeStrct(n).Y] = editSpan(current_row.Z, current_row.Y, angle_delta_value, n);

    end
    



end