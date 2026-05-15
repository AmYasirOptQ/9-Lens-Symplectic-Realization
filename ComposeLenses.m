function [h1,h2,theta3,Ktot,Ltot] = ComposeLenses( ...
    f1,f2,theta1, ...
    g1,g2,theta2)

    % Numerical tolerance
    tol = 1e-12;

    %-----------------------------------------
    % Construct lens matrices
    %-----------------------------------------

    L1 = RotateLens(f1,f2,theta1);
    L2 = RotateLens(g1,g2,theta2);

    %-----------------------------------------
    % Extract power matrices
    %-----------------------------------------

    K1 = ExtractPower(L1);
    K2 = ExtractPower(L2);

    %-----------------------------------------
    % Total optical power
    %-----------------------------------------

    Ktot = K1 + K2;

    % Numerical symmetrization
    Ktot = 0.5*(Ktot + Ktot.');

    %-----------------------------------------
    % Matrix elements
    %-----------------------------------------

    m11 = Ktot(1,1);
    m22 = Ktot(2,2);
    m12 = Ktot(1,2);

    %-----------------------------------------
    % Eigenvalues
    %-----------------------------------------

    Delta = sqrt((m11-m22)^2 + 4*m12^2);

    lambda1 = 0.5*(m11+m22+Delta);
    lambda2 = 0.5*(m11+m22-Delta);

    %-----------------------------------------
    % Degenerate case
    %-----------------------------------------

    denom = max([abs(lambda1),abs(lambda2),1]);

    if abs(lambda1-lambda2)/denom < tol

        theta3 = 0;

    else

        theta3 = 0.5 * atan2(2*m12,m11-m22);

    end

    %-----------------------------------------
    % Focal lengths
    %-----------------------------------------

    if abs(lambda1) < tol
        h1 = Inf;
    else
        h1 = -1/lambda1;
    end

    if abs(lambda2) < tol
        h2 = Inf;
    else
        h2 = -1/lambda2;
    end

    %-----------------------------------------
    % Construct merged 4x4 lens matrix
    %-----------------------------------------

    Ltot = RotateLens(h1,h2,theta3);

end