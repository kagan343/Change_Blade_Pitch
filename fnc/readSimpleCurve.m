function [x, y, z] = readSimpleCurve(fname)

    % Reads a simple 3-column text file: x y z
    % Returns column vectors x, y, z (empty if file missing)
    x = []; y = []; z = [];
    if ~isfile(fname)
        warning('File not found: %s', fname);
        return;
    end
    data = readmatrix(fname, 'FileType', 'text');
    if isempty(data)
        warning('No data read from %s', fname);
        return;
    end
    data = data(:,1:3);  % in case there are extra columns
    x = data(:,1);
    y = data(:,2);
    z = data(:,3);
end