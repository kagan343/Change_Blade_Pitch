function [SH_strc, remove_indices] = trimSH(SH_strc, profile)
% SH is shroud or hub structure
% profile is (1) or (end) index

    % Set profile bounds, using Z for now??
    maxZ_bound = max(profile.Z);
    minZ_bound = min(profile.Z);

    remove_indices = []; % Can't preallocate as # unknown

    % Use Z as conditional for now??
    for i = 1:length(SH_strc.Z)
        if SH_strc.Z(i) >= minZ_bound && SH_strc.Z(i) <= maxZ_bound
            % Have inlcusion as first conditional since want two bounds
            continue
        else
            % Add index to indices list
            remove_indices = [remove_indices, i];
        end
    end

    % Remove x,y,z from index
    % SH_strc.X(remove_indices) = [];
    % SH_strc.Y(remove_indices) = [];
    % SH_strc.Z(remove_indices) = [];

end

            
            
            % indices_to_remove = [1,2]
            % list(indice_to_remove) = [];


