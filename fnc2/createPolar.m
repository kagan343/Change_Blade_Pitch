function [r, theta] = createPolar(z_point, t_point, z_med, t_at_med)
    % Set polar coordinates, angle reference is typical first quad x-axis

    % Radius
    r = ((z_point-z_med)^2 + (t_point-t_at_med)^2)^0.5;

    % Theta
    if z_point < z_med
        if t_point < t_at_med
            theta = 180 + atand( abs(t_at_med - t_point) / abs(z_med - z_point) ); % quad 3, correct

        elseif t_point > t_at_med
            theta = 90 + atand( abs(z_med - z_point) / abs(t_point - t_at_med) ); % quad 2, correct

        end
    
    elseif z_point > z_med
        if t_point > t_at_med
            theta = atand( abs(t_point - t_at_med) / abs(z_point - z_med) ); % quad 1, correct
            
        elseif t_point < t_at_med
            theta = 270 + atand( abs(z_point - z_med) / abs(t_at_med - t_point) ); % quad 4, correct
            
        end
    else % if start point, theta will equal zero
        theta=0; % test for now, need to change
    end

end