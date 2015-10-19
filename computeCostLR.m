function cost = computeCostLR(y,tX,beta)
%COMPUTECOSTLR Summary of this function goes here
%   Detailed explanation goes here
    cost = y'*tX*beta - sum(log(1 + exp(tX*beta))) 
end

