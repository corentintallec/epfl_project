run('loadAndTreat');

nlambda = 500;
lambda = logspace(-8,3,nlambda);
option = 'kFold';
trErs = [];
teErs = [];
k = 4;

for j=1:nlambda
    [teEr,trEr] = kFold(yTr,xTr,k,@(y,x) ridgeRegression(y,x,lambda(j)),@computeCostLS);
    trErs = [trErs trEr];
    teErs = [teErs teEr];
end

subplot(2,1,1);
semilogx(lambda,trErs);
subplot(2,1,2);
semilogx(lambda,teErs,'r');