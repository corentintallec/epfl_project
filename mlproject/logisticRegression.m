function [ beta ] = logisticRegression( tY,tX,alpha )
%LOGISTICREGRESSION Summary of this function goes here
%   Detailed explanation goes here
    cvflag = 1e-5;
    maxiter = 100;
    beta = randn(size(tX,2),size(tY,2));
    iter = 0;
    g = ones(size(tX,2),size(tY,2));
    while(norm(g)>cvflag&&iter<maxiter)
        iter = iter + 1;
        Cost = compute01Cost(tY,tX,beta);
        g = computeGradLR(tY,tX,beta);
        norm(g)
        H = computeHessianLR(tY,tX,beta);
        %Cost
        beta = beta - alpha*H\g;
    end
    iter
end

