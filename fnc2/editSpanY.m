function updated_t_span = editSpanY(spanZ, spanY, cp_strct, angle_delta_value)

    % Find centerpoint
    z_med = median(spanZ);
    med_index = spanZ==z_med;
    t_at_med = spanY(med_index);
    
    % Set leading edge polar coords, leading angle always third quad
    [cp_r, cp_theta] = createPolar(cp_strct.z_coord, cp_strct.t_coord, z_med, t_at_med);

    % Loop through spanZ and edit each element/ index
    for i = 1:length(spanZ)
        
        z_point = spanZ(i);
        t_point = spanY(i);
        
        [r, theta] = createPolar(z_point, t_point, z_med, t_at_med);

        spanY(i) = changeT_viaAngle(r, theta, z_point, t_point, cp_r, cp_theta, angle_delta_value);
    end

    updated_t_span = spanY;
end