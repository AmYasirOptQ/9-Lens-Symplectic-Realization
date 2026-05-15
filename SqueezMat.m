function D = SqueezMat(r1, r2)
% [x, px, y, py] notation
% Allowed squeezing range
rmin = -5;
rmax = 5;

% Check squeezing parameters
if (r1 < rmin || r1 > rmax || r2 < rmin || r2 > rmax)

    error('Squeezing parameters must lie in [%g,%g].', rmin, rmax);

end

% Construct squeezing matrix
D = diag([exp(r1), exp(-r1), exp(r2), exp(-r2)]);

end