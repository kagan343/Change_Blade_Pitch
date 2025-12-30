function [angle_dictionary, avg_angle, angle_diff, cp_strct] = getProfileAngles(profile_strc)
% Iterate over profile structure, determine pitch/ blade angle
    
    % Initialize empty but configured dictionary, and array for avg
    angle_dictionary = configureDictionary("double", "double");
    angle_array = zeros(1,numel(profile_strc));
    first_span = 0; % Initialize to grab center point at first span array

    % Iterate over each element
    for i = 1:numel(profile_strc)
        current_row = profile_strc(i); % Grab current row in strc
        [temp_angle, temp_cp_strct] = getPitch(current_row.Z, current_row.Y, first_span); % Grab angle
        if first_span == 0
            cp_strct = temp_cp_strct;
            first_span = first_span + 1; % Get first_span off of 0
        end
        angle_dictionary(current_row.span) = temp_angle(1); % Set dict with span value
        angle_array(i) = temp_angle(1);
    end

    avg_angle = mean(angle_array);
    angle_diff = angle_array(end) - angle_array(1);
    
end