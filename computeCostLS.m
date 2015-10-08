function cost = computeCostLS( y,tX,beta )
%COMPUTECOSTLS Summary of this function goes here
%   Detailed explanation goes here
    cost = (y - tX*beta)'*(y - tX*beta)
end

