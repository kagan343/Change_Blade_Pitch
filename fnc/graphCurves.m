function graphCurves(hubX, hubY, hubZ, shroudX, shroudY, shroudZ, nProf, profiles)
    % 3D plot: hub, shroud, and all profile curves together
    figure; hold on; grid on; box on;
    axis equal;
    view(3);
    
    % Plot hub and shroud as thicker black lines
    if ~isempty(hubX)
        plot3(hubX, hubY, hubZ, 'k-', 'LineWidth', 2);
    end
    if ~isempty(shroudX)
        plot3(shroudX, shroudY, shroudZ, 'k--', 'LineWidth', 2);
    end
    
    % Color map for profiles
    if nProf > 0
        cmap = lines(nProf);
        for i = 1:nProf
            plot3(profiles(i).X, profiles(i).Y, profiles(i).Z, ...
                  '-', 'LineWidth', 1.2, 'Color', cmap(i,:));
        end
    end
    
    xlabel('radial distance (cm) - x'); ylabel('tangental distance (cm) - y'); zlabel('axial distance (cm) - z');
    title('Hub, Shroud, and Blade Profiles (3D)');
    legendEntries = {};
    
    if ~isempty(hubX),    legendEntries{end+1} = 'Hub';    end %#ok<SAGROW>
    if ~isempty(shroudX), legendEntries{end+1} = 'Shroud'; end %#ok<SAGROW>
    for i = 1:nProf
        if ~isempty(profiles(i).span)
            legendEntries{end+1} = sprintf('Profile %d (%.1f%% span)', ...
                profiles(i).id, profiles(i).span); %#ok<SAGROW>
        else
            legendEntries{end+1} = sprintf('Profile %d', i); %#ok<SAGROW>
        end
    end
    
    if ~isempty(legendEntries)
        legend(legendEntries, 'Location', 'bestoutside');
    end
end