function [updated_z_span, updated_y_span] = editSpanSH(spanZ, spanY, angle_delta_value, removed_indices)

    % Find centerpoint
    z_med = median(spanZ);
    med_index = spanZ==z_med;
    t_at_med = spanY(med_index);

    % Set start and end of profile tip
    % fields = [lead_z, lead_y, trail_z, trail_y, break_index, trail_index]
    edges = get_edges(spanZ, spanY, removed_indices);


    %%%%% ANGLE: Loop through spanZ and edit each element/ index
    for i = 1:length(spanZ)
        
        if ismember(i, removed_indices)
            % Below keeps exactly the same, points trasnlated later
            spanZ(i) = spanZ(i);
            spanY(i) = spanY(i);
            continue
        end

        z_point = spanZ(i);
        t_point = spanY(i);
        
        [r, theta] = createPolar(z_point, t_point, z_med, t_at_med);

        [spanZ(i), spanY(i)] = change_viaAngle(r, theta, angle_delta_value, z_med, t_at_med);

    end
    %%%%%

    %%%%% TRASNLATE: translate removed indices
    delta = get_deltas(edges, spanZ, spanY); % delta.[Z_lead, Y_lead, Z_trail, Y_trail] 
    % LEAD LOOP
    for i = 1:edges.break_index
        [spanZ(i), spanY(i)] = translate(spanZ(i), spanY(i), delta.Z_lead, delta.Y_lead);
    end
    % TRAIL LOOP
    for i = edges.trail_index:removed_indices(end)
        [spanZ(i), spanY(i)] = translate(spanZ(i), spanY(i), delta.Z_trail, delta.Y_trail);
    end
    %%%%%



    % Create output names
    updated_z_span = spanZ;
    updated_y_span = spanY;
end