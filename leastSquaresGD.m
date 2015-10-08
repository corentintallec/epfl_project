function beta = leastSquaresGD(y,tX,alpha)
    cvflag = 1e-6
    predCost = -1
    beta = randn(size(tX,2),size(y,2))
    Cost = 1000
    while(abs(Cost-predCost)>cvflag)
        predCost = Cost
        Cost = computeCostLS(y,tX,beta)
        
        g = computeGradLS(y,tX,beta)
        beta = beta - alpha*g
    end
end
