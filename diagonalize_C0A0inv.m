function [f1,f2,varphi,Rvarphi,D] = diagonalize_C0A0inv(C0,A0)

    % Compute symmetric matrix
    M = C0 / A0;

    % Numerical symmetrization
    M = 0.5 * (M + M.');

    % Matrix elements
    m11 = M(1,1);
    m22 = M(2,2);
    m12 = M(1,2);

    % Eigenvalue discriminant
    Delta = sqrt((m11 - m22)^2 + 4*m12^2);

    % Eigenvalues
    lambda1 = 0.5 * (m11 + m22 + Delta);
    lambda2 = 0.5 * (m11 + m22 - Delta);

    % Relative tolerance
    tol = 1e-12;

    % Handle nearly degenerate case
    if abs(lambda1 - lambda2)/max(abs(lambda1),abs(lambda2)) < tol

        varphi = 0;

    else

        varphi = 0.5 * atan2(2*m12, m11 - m22);

    end

    % Rotation matrix
    Rvarphi = [cos(varphi), -sin(varphi);
               sin(varphi),  cos(varphi)];

    % Diagonalized matrix
    D = Rvarphi.' * M * Rvarphi;

    % Extract focal lengths
    %
    % D should equal:
    %
    % [ -1/f1    0   ]
    % [   0    -1/f2 ]

    lambda1 = D(1,1);
    lambda2 = D(2,2);

    % Check for singular focal lengths
    if abs(lambda1) < tol
        f1 = Inf;
    else
        f1 = -1/lambda1;
    end

    if abs(lambda2) < tol
        f2 = Inf;
    else
        f2 = -1/lambda2;
    end

end