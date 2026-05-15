function Rot = RotMat(a, theta)
% [x, px, y, py] notation
c = cos(theta);
s = sin(theta);

switch a

    case 0 % J0
        Rot = [c, -s, 0, 0;
               s,  c, 0, 0;
               0,  0, c, -s;
               0,  0, s,  c];

    case 1 % J1
        Rot = [c, -s, 0, 0;
               s,  c, 0, 0;
               0,  0, c,  s;
               0,  0,-s,  c];

    case 2 % J2
        Rot = [c, 0, 0, -s;
               0, c, s,  0;
               0,-s, c,  0;
               s, 0, 0,  c];

    case 3 % J3
        Rot = [c, 0, s, 0;
               0, c, 0, s;
              -s, 0, c, 0;
               0,-s, 0, c];

    otherwise
        error('First input must be 0, 1, 2, or 3.')

end

end

