function [angle, cp_strct] = getPitch(spanZ, spanY, first_span)
% Define chord line and angle its at
% Angle is pitch/ blade angle: arctan( axial distance / tang. distance )
% See screenshot on nov 25 2025

    % Find min and max of Z/ axial values
    zmin = min(spanZ);
    zmax = max(spanZ);
    min_index = spanZ==zmin; % retruns logical index ex. 0 0 1 where spanZ==zmin
    max_index = spanZ==zmax;
    
    % Grab tangent value at min and max indices
    t_at_min = spanY(min_index);
    t_at_max = spanY(max_index);
    
    % Angle
    % angle = atand( (t_at_max - t_at_min) / (zmax - zmin) ); % reverse pitch
    angle = atand( (zmax - zmin) / (t_at_max - t_at_min) );

    % Initialize cp_strct
    % cp_strct = {};

    if first_span == 0
        % Find centerpoint
        z_med = median(spanZ);
        med_index = spanZ==z_med;
        t_at_med = spanY(med_index);

        % Assign to structure
        cp_strct.z_coord = z_med;
        cp_strct.t_coord = t_at_med;
        
        % Get angle
        cp_strct.trailing_angle = atand( (zmax - z_med) / (t_at_max - t_at_med) );
        cp_strct.leading_angle = atand( (z_med - zmin) / (t_at_med - t_at_min) );

        % figure;
        % hold on
        % plot(spanZ, spanY);
        % plot([zmin zmax], [t_at_min t_at_max])
        % scatter(z_med, t_at_med)
        % hold off
    else
        cp_strct = 0;
    end

    %%% Plot for visual if wanted, commenting out for now
    % figure;
    % hold on
    % plot(spanZ, spanY);
    % plot([zmin zmax], [t_at_min t_at_max])
    % hold off
    % xlim([-2.5 5]); % Sets x-axis limits from 0 to 5
    % ylim([-2.5 5]); % Sets y-axis limits from -1 to 1

end