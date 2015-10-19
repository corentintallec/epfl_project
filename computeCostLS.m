function cost = computeCostLS( y,tX,beta )
%COMPUTECOSTLS Summary of this function goes here
%   Detailed explanation goes here
    cost = sqrt(1./size(y,1)*(y - tX*beta)'*(y - tX*beta));
end

