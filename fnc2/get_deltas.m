function delta = get_deltas(edges, spanZ, spanY)
% Find deltaZ and deltaY between original span trail/ lead points and the
% updated points after ptich angle is changed
% edges.[lead_z, lead_y, trail_z, trail_y, break_index, trail_index]

    delta.Z_lead = edges.lead_z - spanZ(edges.break_index+1);
    delta.Y_lead = edges.lead_y - spanY(edges.break_index+1);
    
    delta.Z_trail = edges.trail_z - spanZ(edges.trail_index-1);
    delta.Y_trail = edges.trail_y - spanY(edges.trail_index-1);

end
