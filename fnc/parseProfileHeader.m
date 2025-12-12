function [idVal, spanVal] = parseProfileHeader(name)
    % Tries to parse something like "Profile 1 at 20.00%"
    idVal = [];
    spanVal = [];

    tokens = regexp(name, 'Profile\s+(\d+)\s+at\s+([\d\.]+)%', 'tokens', 'once');
    if ~isempty(tokens)
        idVal   = str2double(tokens{1});
        spanVal = str2double(tokens{2});
    end
end