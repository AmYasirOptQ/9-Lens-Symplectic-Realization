function K = ExtractPower(L)

    %-----------------------------------------
    % Extract 2x2 optical power matrix
    %
    % Input:
    %   L : 4x4 thin-lens symplectic matrix
    %       in [x,px,y,py] ordering
    %
    % Output:
    %   K : 2x2 optical power matrix
    %-----------------------------------------

    % Optional consistency check
    if ~isequal(size(L),[4 4])
        error('Input matrix must be 4x4.');
    end

    % Extract lower-left power block
    %
    % L structure:
    %
    % [1   0   0   0]
    % [K11 1  K12  0]
    % [0   0   1   0]
    % [K21 0  K22  1]

    K = [L(2,1), L(2,3);
         L(4,1), L(4,3)];

    % Numerical symmetrization
    K = 0.5*(K + K.');

end