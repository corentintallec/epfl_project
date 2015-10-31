function beta = ridgeRegression(y,tX,lambda)
% Ridge regression using normal equation
Id = eye(size(tX,2));
Id(1) = 0; % To do not regularize beta0
beta = (tX'*tX + lambda * Id)\tX'*y;
end

