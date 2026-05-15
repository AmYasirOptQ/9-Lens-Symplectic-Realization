function [tildeS,A0,C0,U] = preIwasawa(S)
        V = [1, 0, 0, 0;
             0, 0, 1, 0;
             0, 1, 0, 0;
             0, 0, 0, 1];
        tildeS = V*S*V; 
        A = [tildeS(1,1), tildeS(1,2);
             tildeS(2,1), tildeS(2,2)];
        B = [tildeS(1,3), tildeS(1,4);
             tildeS(2,3), tildeS(2,4)]; 
        C = [tildeS(3,1), tildeS(3,2);
             tildeS(4,1), tildeS(4,2)]; 
        D = [tildeS(3,3), tildeS(3,4);
             tildeS(4,3), tildeS(4,4)]; 
        
        A0 = sqrtm(A*A.' + B*B.');
        C0 = (C*A.' + D*B.')/(A0); % inv(A0)
        X = A0\A; % inv(A0)*A;
        Y = A0\B; % inv(A0)*B;
        U = X - 1i*Y;
end