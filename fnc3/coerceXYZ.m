function [X, Y, Z] = coerceXYZ(X, Y, Z)
    % Ensures X,Y,Z are same-length column vectors.

    X = X(:); Y = Y(:); Z = Z(:);

    n = numel(X);
    if numel(Y) ~= n || numel(Z) ~= n
        error("X, Y, Z must be the same length. Got: X=%d, Y=%d, Z=%d", ...
              numel(X), numel(Y), numel(Z));
    end

    if ~isnumeric(X) || ~isnumeric(Y) || ~isnumeric(Z)
        error("X, Y, Z must be numeric arrays.");
    end
end