function [Eq79P, Sym] = Eq79Par(pid)
        % pid = 10 input parameters using the pre-Iwasawa decomposition.
        % Eq79P = 14 output parameters corresponding to Eq. (79)
        % Sym = output symplectic matrix
        
        a = pid(1); b = pid(2); phi = pid(3);
        f1 = pid(4); f2 = pid(5); varphi = pid(6);
        alpha = pid(7); beta = pid(8); gamma = pid(9); delta = pid(10);
        Eq79P = zeros(1,14);
        
%%        
        
        f3 = 1/2; f5 = 1/2;
        f4 = sin(2*gamma)/(1-cos(2*gamma)+sin(2*gamma));
        f7 = sin(2*gamma)/(1-cos(2*gamma)+sin(2*gamma));
        f6 = 1/(2+sin(2*gamma));

        ang = alpha+gamma;
        f8 = (a*a*sin(ang))/(a + cos(ang) + a*a*sin(ang));
        f9 = (b*b*sin(ang))/(b + cos(ang) + b*b*sin(ang));
        f10 = 1/(2+a*sin(ang));
        f11 = 1/(2+b*sin(ang));
        f12 = (a*sin(ang))/(1 + a*cos(ang) + a*sin(ang));
        f13 = (b*sin(ang))/(1 + b*cos(ang) + b*sin(ang));

        alpha1 = pi+beta + delta; 
        alpha2 = varphi + beta + delta;
        alpha3 = phi + beta + delta; % typo below Eq. (75)
        
%%

[fx1,fy1,alpha4,Ktot1] = ComposeLenses(f1,f2,alpha2,f8,f9,alpha3);
[fx2,fy2,alpha5,Ktot2] = ComposeLenses(f12,f13,alpha3,f3,f4,delta);

%% All 14 output parameters corresponding to Eq. (79)

Eq79P(1:7) = [alpha1, alpha4, fx1, fy1, alpha3, f10, f11];
Eq79P(8:14) = [alpha5, fx2, fy2, delta, f5, f6, f7];

%% Output symplectic matrix

Sym = eye(4); % identity matrix
Sym = Mult(Sym, RotMat(3, alpha1));
Sym = Mult(Sym, RotateLens(fx1, fy1, alpha4));
Sym = Mult(Sym, Prop(1));
Sym = Mult(Sym, RotateLens(f10, f11, alpha3));
Sym = Mult(Sym, Prop(1));
Sym = Mult(Sym, RotateLens(fx2, fy2, alpha5));
Sym = Mult(Sym, Prop(1));
Sym = Mult(Sym, RotateLens(f5, f6, delta));
Sym = Mult(Sym, Prop(1));
Sym = Mult(Sym, RotateLens(Inf, f7, delta));

end