function [z_new, t_new] = change_viaAngle(r, theta, angle_delta_value, z_med, t_at_med)

    % Set wanted global angle
    wanted_angle = theta + angle_delta_value;

    % Safegaurd for quad 4 to quad 1
    if wanted_angle > 360
        % angle delta value might mush quad 4 back into quad 1+
        % this code is working assuming angle_delta_value won't
        % be > 360, which physically shouldn't happen for blades
        wanted_angle = wanted_angle - 360;
    end


    % If z > z_med, add calcuated z to z_med (quad 1 and 4)
    % If z < z_med, subtract calcuated z from z_med (quad 2 and 3)
    if wanted_angle > 0 && wanted_angle < 90 % quad 1
        % t_new = t_at_med + z_med / (ratio - tand(wanted_angle));
        % z_new = ratio * (t_new + t_at_med) + z_med;
        z_new = z_med + cosd(wanted_angle)*r;
        t_new = t_at_med + sind(wanted_angle)*r;


    elseif wanted_angle > 90 && wanted_angle < 180 % quad 2
        wanted_reduced = wanted_angle - 90;
        z_new = z_med - sind(wanted_reduced)*r;
        t_new = t_at_med + cosd(wanted_reduced)*r;


    elseif wanted_angle > 180 && wanted_angle < 270 % quad 3
        wanted_reduced = wanted_angle - 180;
        z_new = z_med - cosd(wanted_reduced)*r;
        t_new = t_at_med - sind(wanted_reduced)*r;


    elseif wanted_angle > 270 && wanted_angle < 360 % quad 4
        wanted_reduced = wanted_angle - 270;
        z_new = z_med + sind(wanted_reduced)*r;
        t_new = t_at_med - cosd(wanted_reduced)*r;
    end

end