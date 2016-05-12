function [ H ] = computeHessianLR( tY,tX,beta )
%COMPUTEHESSIANLR Summary of this function goes here
%   Detailed explanation goes here
    N = size(tX,1.);
    ybar = sigmoid(tX*beta);
    S = ybar .* (1. - ybar) + 1e-5;
    H = 1./N * tX' * diag(S) * tX;

end

