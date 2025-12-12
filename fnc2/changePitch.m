function changedBladeStrct = changePitch(superStrct, angle_delta_value, point)

% Grab:
profile = superStrct.subProfileStrct.profile; % blade profile structure
cp_strct = superStrct.subProfileStrct.cp_strct; % center point structure

if point == 'leading_edge'
    
    changedBladeStrct = changeViaLead(profile, cp_strct, angle_delta_value);

end











end