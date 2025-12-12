function new_t = changeT_viaAngle(r, theta, z_point, t_point, cp_r, cp_theta, angle_delta_value);

    % 1.2 of angle changed via T, other half via Z
    wanted_angle = theta + 0.5*angle_delta_value;

    new_t = t_point;
    % if wanted_angle > 0 && wanted_angle < 90
    %     new_t = tand(wanted_angle) * z_point;
    % elseif wanted_angle > 90 && wanted_angle < 180
    %     new_t = z_point / tand(wanted_angle - 90);
    % elseif wanted_angle > 180 && wanted_angle < 270
    %     new_t = z_point * tand(wanted_angle - 180);
    % elseif wanted_angle > 270 && wanted_angle < 360
    %     new_t = z_point / tand(wanted_angle - 270);
    % else % if starting point angle will be 0
    %     new_t = t_point; % Set it to original point
    % end

end