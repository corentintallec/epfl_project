function [ cost ] = compute01Cost( tY,tX,beta )
%COMPUTE01COST Summary of this function goes here
%   Detailed explanation goes here
    N = size(tY,1);
    cost = 1./N * sum(tY == (2*(sigmoid(tX*beta)>0.5)-1),1);
end

