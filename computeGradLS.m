function g = computeGradLS( y,tX,beta)
%COMPUTEGRADLS Summary of this function goes here
%   Detailed explanation goes here
    g = 2*tX'*(tX*beta-y)
end

