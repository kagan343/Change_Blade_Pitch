function writeProfileCurve(filePath, bladeStructArr, spanPercents)
    % Writes multi-profile curve file with headers like:
    % # Profile 1 at 0.0000%
    % <XYZ rows>
    % <blank line>
    %
    % Uses x:7 decimals, y:8 decimals, z:10 decimals (safe for your examples).

    fid = fopen(filePath, 'w');
    if fid < 0
        error("Could not open for writing: %s", filePath);
    end

    N = numel(bladeStructArr);
    fmtData = '%16.7f%16.8f%16.10f\n';

    for p = 1:N
        prof = bladeStructArr(p);

        if ~isfield(prof,'X') || ~isfield(prof,'Y') || ~isfield(prof,'Z')
            fclose(fid);
            error("changeBladeStrct(%d) must contain fields X, Y, Z.", p);
        end

        [X, Y, Z] = coerceXYZ(prof.X, prof.Y, prof.Z);

        % Header: first uses 4 decimals (0.0000%), others in your example are 2 decimals.
        % We'll write all with 4 decimals to keep it consistent and safe.
        fprintf(fid, '# Profile %d at %.4f%%\n', p, spanPercents(p));

        for i = 1:numel(X)
            fprintf(fid, fmtData, X(i), Y(i), Z(i));
        end

        % Blank line between profiles (your example has one)
        fprintf(fid, '\n');
    end

    fclose(fid);
end