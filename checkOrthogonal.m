function checkOrthogonal(O)

err = norm(O.'*O - eye(size(O)));

fprintf('Orthogonality error = %.3e\n', err);

end