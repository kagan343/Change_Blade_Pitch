function [changedBladeStrct, changedHubStrct, changedShroudStrct]  = changePitch(superStrct, angle_delta_value, point, hubStrct, shroudStrct)

    % Grab:
    profile = superStrct.subProfileStrct.profile; % blade profile structure
    
    if point == 'leading_edge'
        
        changedBladeStrct = changeViaLead(profile, angle_delta_value);
        changedHubStrct = changeSH_viaLead(hubStrct, angle_delta_value, profile, 'Hub');
        changedShroudStrct = changeSH_viaLead(shroudStrct, angle_delta_value, profile, 'Shroud');
    
    end

end