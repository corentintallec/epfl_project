function g = computeGradLS( y,tX,beta)
%COMPUTEGRADLS Summary of this function goes here
%   Detailed explanation goes here
    N = size(tX,1);
    g = 1./N*2*tX'*(tX*beta-y);
end

