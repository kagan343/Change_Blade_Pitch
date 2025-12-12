function profiles = readProfileCurves(fname)
    % Reads profile.curve with multiple sections:
    %   # Profile 1 at 0.0000%
    %   <x y z lines>
    %   (blank line)
    %   # Profile 2 at 20.00%
    %   <x y z lines>
    %
    % Returns struct array with fields:
    %   name - header line (string)
    %   id - profile index (number, if parsed)
    %   span - span percentage (number, if parsed)
    %   X,Y,Z - column vectors of coordinates

    profiles = struct('name',{},'id',{},'span',{},'X',{},'Y',{},'Z',{});

    if ~isfile(fname)
        warning('File not found: %s', fname);
        return;
    end

    fid = fopen(fname, 'r');
    if fid < 0
        warning('Could not open %s', fname);
        return;
    end

    currentX = [];
    currentY = [];
    currentZ = [];
    currentName = '';
    currentID = [];
    currentSpan = [];

    while true
        line = fgetl(fid);
        if ~ischar(line)
            % End-of-file: push last profile if we were building one
            if ~isempty(currentX)
                profiles(end+1) = makeProfile(currentName, currentID, currentSpan, ...
                                              currentX, currentY, currentZ); %#ok<AGROW>
            end
            break;
        end

        s = strtrim(line);
        if isempty(s)
            % Skip blank lines
            continue;
        end

        if startsWith(s, '#')
            % New profile header. First, store the previous one.
            if ~isempty(currentX)
                profiles(end+1) = makeProfile(currentName, currentID, currentSpan, ...
                                              currentX, currentY, currentZ); %#ok<AGROW>
            end

            currentName = strtrim(s(2:end)); % drop '#'
            [currentID, currentSpan] = parseProfileHeader(currentName);

            currentX = [];
            currentY = [];
            currentZ = [];
        else
            % Numeric data line
            nums = sscanf(s, '%f');
            if numel(nums) >= 3
                currentX(end+1,1) = nums(1); %#ok<AGROW>
                currentY(end+1,1) = nums(2); %#ok<AGROW>
                currentZ(end+1,1) = nums(3); %#ok<AGROW>
            end
        end
    end

    fclose(fid);
end