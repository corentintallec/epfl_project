function g = computeGradRR(y,tX,beta,lambda)
%COMPUTEGRADLS Summary of this function goes here
%   Detailed explanation goes here
    N = size(y,1);
    g = 1./N*(2*tX'*(tX*beta-y) + lambda*beta);
end