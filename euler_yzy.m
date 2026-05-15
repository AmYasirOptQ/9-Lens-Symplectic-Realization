function [alpha,beta,gamma,delta] = euler_yzy(U)
%--------------------------------------------------------------
% Extract Euler angles from
%
% U = exp(i*alpha) exp(i*beta*sigma2)
%     exp(i*gamma*sigma3) exp(i*delta*sigma2)
%
% Convention follows Eqs. (42)-(47) of:
% P. A. Ameen Yasir, JOSA A 38, 644 (2021)
%
% Input:
%   U : 2x2 unitary matrix
%
% Output:
%   alpha,beta,gamma,delta
%
% Ranges:
%   0 <= alpha < 2*pi
%   0 <= beta,delta < pi
%   0 <= gamma <= pi/2
%--------------------------------------------------------------

%----- alpha ---------------------------------------------------
detU  = det(U);

alpha = -0.5i*log(detU);
alpha = real(alpha);

% wrap alpha into [0,2*pi)
alpha = mod(alpha,2*pi);

%----- remove global phase ------------------------------------
U0 = U*exp(-1i*alpha);

u11 = U0(1,1);
u12 = U0(1,2);

%----- gamma ---------------------------------------------------
cg = sqrt(real(u11)^2 + real(u12)^2);

% numerical protection
cg = min(max(cg,-1),1);

gamma = acos(cg);

%----- beta + delta -------------------------------------------
phi_plus = angle(real(u11) - 1i*real(u12));

beta_plus_delta = -phi_plus;

% wrap to [0,2*pi)
beta_plus_delta = mod(beta_plus_delta,2*pi);

%----- beta - delta -------------------------------------------
sg = sqrt(imag(u11)^2 + imag(u12)^2);

if sg < 1e-12
    % gamma = 0 special case
    beta_minus_delta = 0;
else
    phi_minus = angle(imag(u11) + 1i*imag(u12));

    beta_minus_delta = -phi_minus;

    % wrap to [0,2*pi)
    beta_minus_delta = mod(beta_minus_delta,2*pi);
end

%----- solve for beta and delta -------------------------------
beta  = 0.5*(beta_plus_delta + beta_minus_delta);
delta = 0.5*(beta_plus_delta - beta_minus_delta);

% % wrap into [0,pi)
% beta  = mod(beta,pi);
% delta = mod(delta,pi);

% Final wrap to your paper's convention [0, pi)
beta_wrapped  = mod(beta, pi);
delta_wrapped = mod(delta, pi);

% Check if the wrapping caused a sign flip
% If (beta_wrapped != beta), it means we removed a 'pi'
if abs(beta_wrapped - beta) > 1e-9
    alpha = alpha + pi;
end

% If (delta_wrapped != delta), it means we removed a 'pi'
if abs(delta_wrapped - delta) > 1e-9
    alpha = alpha + pi;
end

% Final canonical wrap for alpha
alpha = mod(alpha, 2*pi);
beta  = beta_wrapped;
delta = delta_wrapped;

end