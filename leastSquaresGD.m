function beta = leastSquaresGD(y,tX,alpha)
    cvflag = 1e-6
    beta = randn(size(tX,2),size(y,2))
    g = ones(size(tX,2),size(y,2));
    while(norm(g)>cvflag)       
        g = computeGradLS(y,tX,beta);
        beta = beta - alpha*g;
    end
end
