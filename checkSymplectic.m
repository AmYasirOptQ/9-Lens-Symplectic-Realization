function checkSymplectic(S, int)

% check whether the given S is symplectic.
% int = 1 - for [x, px, y, py] notation
% int = 2 - for [x, y, px, py] notation

Omega = [0 1 0 0;
        -1 0 0 0;
         0 0 0 1;
         0 0 -1 0];
     
OmegaT = [0 0 1 0;
          0 0 0 1;
         -1 0 0 0;
          0 -1 0 0];  
      
      switch int
          case 1
              err = norm(S.'*Omega*S - Omega);
          case 2
              err = norm(S.'*OmegaT*S - OmegaT);
          otherwise
              disp('Enter 1 or 2');
      end

% err = norm(S.'*Omega*S - Omega);

fprintf('Symplectic error = %.3e\n', err);

end