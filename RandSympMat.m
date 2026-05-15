function Sym = RandSympMat(par)
        % [x, px, y, py] notation
        % This function generates a random 4x4 symplectic matrix
        % based on the Euler decomposition. RotMat function generates
        % the rotation matrix, whereas SqueezMat function generates 
        % the squeezing matrix.
        % par is a 1x10 vector containing 10 independent parameters.
                
        Rot1 = RotMat(0,par(1))*RotMat(1,par(2))*RotMat(3,par(3))*RotMat(1,par(4));
        Rot2 = RotMat(0,par(5))*RotMat(1,par(6))*RotMat(3,par(7))*RotMat(1,par(8));
        Sqz = SqueezMat(par(9), par(10));
        
        Sym = Rot1*Sqz*Rot2;
end