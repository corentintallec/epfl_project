function beta = leastSquares(y,tX)
% Least squares using normal equations
    beta = (tX'*tX)\tX'*y;
end

