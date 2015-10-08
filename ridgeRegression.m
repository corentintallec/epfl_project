function beta = ridgeRegression(y,tX,lambda)
%RIDGEREGRESSION Summary of this function goes here
%   Detailed explanation goes here
    beta = (tX'*tX - lambda * eye(size(tX,2)))\tX'*y;
end

