function [updated_z_span, updated_y_span] = editSpan(spanZ, spanY, angle_delta_value)

    % Find centerpoint
    z_med = median(spanZ);
    med_index = spanZ==z_med;
    t_at_med = spanY(med_index);

    % Loop through spanZ and edit each element/ index
    for i = 1:length(spanZ)
        
        z_point = spanZ(i);
        t_point = spanY(i);
        
        [r, theta] = createPolar(z_point, t_point, z_med, t_at_med);

        [spanZ(i), spanY(i)] = change_viaAngle(r, theta, angle_delta_value, z_med, t_at_med);

    end

    updated_z_span = spanZ;
    updated_y_span = spanY;

end