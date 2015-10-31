run('loadAndTreat');
nsample = 30;
lambda = 1e-6;
k = 4;
teErrs = zeros(nsample,1);
for i=1:nsample
    A = randperm(size(xTr,1));
    xTr = xTr(A,:);
    yTr = yTr(A,:);
    [teErr,trErr] = kFold(yTr,xTr,k,@(y,x) ridgeRegression(y,x,lambda),@computeCostLS);
    teErrs(i,1) = teErr;
end
hist(teErrs);

beta = ridgeRegression(yTr,xTr,lambda);
pred = xTe*beta*ystd + ymean