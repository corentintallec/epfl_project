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
    teErrs(i,1) = teErr*ystd;
end
mean(teErrs)
ystd
beta = ridgeRegression(yTr,xTr,lambda);
pred = xTe*beta*ystd + ymean;
teerror = ['rmse', num2str(mean(teErrs))];

f = fopen('test_errors_regression.csv','wt')
fprintf(f,strcat('rmse,',num2str(mean(teErrs))));
csvwrite('predictions_regression.csv',pred);
