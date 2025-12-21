function edges = get_edges(spanZ, spanY, removed_indices)
% Grab the original values for spanZ and spanY right after and before the
% "inside" of the removed indices

    differences = diff(removed_indices);

    break_index = find(differences>1); % true index of break, just happens to match given indices go 1,2,3,etc

    trail_index = removed_indices(break_index+1); % true index of trailing after break

    edges.lead_z = spanZ(break_index+1); % +1 for point right after trail break
    edges.lead_y = spanY(break_index+1);
    edges.trail_z = spanZ(trail_index-1); % -1 for point right before trail break
    edges.trail_y = spanY(trail_index-1);

    edges.break_index = break_index;
    edges.trail_index = trail_index;

end