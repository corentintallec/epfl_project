function beta = ridgeRegressionGD(y,tX,lambda,alpha)
    cvflag = 1e-6;
    maxiter = 10000;
    predCost = -1;
    beta = randn(size(tX,2),size(y,2));
    beta_old = zeros(size(tX,2),size(y,2));
    Cost = 1000;
    iter = 0;
    while(norm(beta-beta_old,2)>cvflag&&iter<maxiter)
        iter = iter + 1;
        beta_old = beta;
        predCost = Cost;
        Cost = computeCostLS(y,tX,beta);
        Cost
        g = computeGradRR(y,tX,beta,lambda);
        beta = beta - alpha*g;
    end
end