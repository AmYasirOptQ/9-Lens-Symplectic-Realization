function M = Leny(f)
M = sym(eye(4));   % IMPORTANT: symbolic identity matrix
M(4,3) = -1/f;
end