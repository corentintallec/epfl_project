function cost = computeCostLS( y,tX,beta )
%COMPUTECOSTLS Summary of this function goes here
%   Detailed explanation goes here
    e = y - tX*beta;
    N = size(y,1);
    cost = sqrt(e'*e/(2*N));
end

