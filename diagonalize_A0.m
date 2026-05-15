function [a,b,phi,Rphi] = diagonalize_A0(A0)

    % Numerical symmetrization
    A0 = 0.5*(A0 + A0.');

    m11 = A0(1,1);
    m22 = A0(2,2);
    m12 = A0(1,2);

    % Eigenvalue discriminant
    Delta = sqrt((m11 - m22)^2 + 4*m12^2);

    % Eigenvalues
    a = 0.5*(m11 + m22 + Delta);
    b = 0.5*(m11 + m22 - Delta);

    % Tolerance for near-degeneracy
    tol = 1e-12;

    % If nearly proportional to identity,
    % rotation angle is physically irrelevant
    if abs(a-b)/max(abs(a),abs(b)) < tol

        phi = 0;

    else

        phi = 0.5 * atan2(2*m12, m11 - m22);

    end

    % Rotation matrix
    Rphi = [cos(phi), -sin(phi);
            sin(phi),  cos(phi)];

end