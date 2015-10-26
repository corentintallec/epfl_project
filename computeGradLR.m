function [ g ] = computeGradLR( tY, tX, beta )
%COMPUTEGRADLR Summary of this function goes here
%   Detailed explanation goes here
    N = size(tX,1);
    g = 1./N * tX' * (sigmoid(tX*beta) - tY);
end

