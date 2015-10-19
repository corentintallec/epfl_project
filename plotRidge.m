function [] = plotRidge( tY, tX, k, lambda_range )
%PLOTRIDGE Summary of this function goes here
%   Detailed explanation goes here
    testEs = [];
    trainEs = [];
    for lambda=lambda_range
        [testE,trainE] = kFold(tY,tX,k,@(y,x) ridgeRegression(y,x,lambda),@computeCostLS);
        testEs = [testEs testE];
        trainEs = [trainEs trainE];
    end
    plot(lambda_range,testEs,lambda_range,trainEs)
end

