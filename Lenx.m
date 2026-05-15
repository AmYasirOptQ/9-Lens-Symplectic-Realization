function M = Lenx(f)
M = sym(eye(4));   % IMPORTANT: symbolic identity matrix
M(2,1) = -1/f;
end