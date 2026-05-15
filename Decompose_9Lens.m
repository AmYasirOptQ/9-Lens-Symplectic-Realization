%% This program computes the lens parameters based on the paper
% https://doi.org/10.1364/JOSAA.423143

clear
clc
close all

%% 10 parameters to create the symplectic matrix based on the
% Euler decomposition. Squeezing is restricted between [-5,5].

par = 2*pi*rand(1,10);
par(9) = -5 + 10*(par(9)/(2*pi));
par(10) = -5 + 10*(par(10)/(2*pi));
Sy = RandSympMat(par);
disp('Input symplectic matrix');
disp(Sy);
checkSymplectic(Sy, 1); % 1 for [x,px,y,py] notation

%% Pre-Iwasawa decomposition

[tildeS,A0,C0,U] = preIwasawa(Sy);
[a,b,phi,Rphi] = diagonalize_A0(A0); % 3 parameters
[f1,f2,varphi,Rvarphi,D] = diagonalize_C0A0inv(C0,A0); % 3 parameters
[alpha,beta,gamma,delta] = euler_yzy(U); % 4 parameters

pid = zeros(1,10); % all 10 input parameters
pid(1:3) = [a, b, phi];
pid(4:6) = [f1, f2, varphi];
pid(7:10) = [alpha, beta, gamma, delta];

%% Decomposition using Eq. (79)

sin_ag = sin(alpha + gamma);
tol = 1e-12;

if abs(sin_ag) > tol
    [Eq79P, Sym] = Eq79Par(pid);
    disp('Output symplectic matrix');
    disp(Sym);
    Serr = norm(abs(Sym - Sy),'fro');
    fprintf('Symplectic matrix error = %.3e\n', Serr);
else
    disp('Eq. (79) is singular because sin(alpha+gamma) is 0.');
end







