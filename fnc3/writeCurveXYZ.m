function writeCurveXYZ(filePath, X, Y, Z, zDecimals)
    % Writes a single curve file (hub/shroud style): just XYZ rows, no headers.

    [X, Y, Z] = coerceXYZ(X, Y, Z);

    fid = fopen(filePath, 'w');
    if fid < 0
        error("Could not open for writing: %s", filePath);
    end

    % Match example look: x 7 decimals, y 8 decimals, z 8 decimals (or chosen)
    fmt = sprintf('%%16.7f%%16.8f%%16.%df\\n', zDecimals);

    for i = 1:numel(X)
        fprintf(fid, fmt, X(i), Y(i), Z(i));
    end

    fclose(fid);
end