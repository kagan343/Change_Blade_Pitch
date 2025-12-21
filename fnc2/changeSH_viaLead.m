function changedStrct = changeSH_viaLead(SH_strc, angle_delta_value, profile_strc, sh_str)
% Change shroud and hub data via lead

    % Set angle for zeroing, angle = leading edge angle
    %zero_angle = cp_strct.leading_angle;
    
    % Create copy of profile_strc
    if strcmp(sh_str, 'Hub')
        
        % Set changedStrct for editting, trim to only points within
        % profile/0% or 100% spans
        % hub, use first index of profile structure
        [changedStrct, removed_indices] = trimSH(SH_strc, profile_strc(end));
    
        % Edit trimmed structure
        [changedStrct.Z, changedStrct.Y] = editSpanSH(changedStrct.Z, changedStrct.Y, angle_delta_value, removed_indices);

    elseif strcmp(sh_str,'Shroud')

        % Set changedStrct for editting, trim to only points within
        % profile/0% or 100% spans
        % shroud, use end index of profile structure
        [changedStrct, removed_indices] = trimSH(SH_strc, profile_strc(end));

        [changedStrct.Z, changedStrct.Y] = editSpanSH(changedStrct.Z, changedStrct.Y, angle_delta_value, removed_indices);

    end

end