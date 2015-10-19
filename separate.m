function [ sign ] = separate( beta, tX, tY )
%SEPARATE Summary of this function goes here
%   Detailed explanation goes here
    PCA = pca(tX);
    sign = (tX*PCA(:,1:2))*(PCA(:,1:2)'*beta) - tY > 0;

end

