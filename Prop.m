function M = Prop(d)
M = eye(4);   % identity matrix
M(1,2) = d;
M(3,4) = d;
end