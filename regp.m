data = load('Rome_regression');
tX = data.X_train;
tY = data.y_train;

N = 10;
P = 5;
lambda = 0.01;
mseTes = zeros(N,P);
mseTrs = zeros(N,P);
lambdas = logspace(-5,1,P);
for i = 1:N
    for j = 1:P
        lambda = lambdas(j);
        baseX = tX(:,49);
        tXp = poly(baseX,i);
        tXp = [tXp tX];
        tXp = normalize(tXp);
        tY = normalize(tY);
        [mseTe,mseTr] = kFold(tY,tXp,5,@(tY,tX) ridgeRegressionGD(tY,tX,lambda,0.03),@computeCostLS);
        mseTes(i,j) = mseTe;
        mseTrs(i,j) = mseTr;
    end
end
figure;

for j = 1:P
    lambda = lambdas(j);
    subplot(ceil(sqrt(P)),ceil(sqrt(P)),j)
    hold on
    title(num2str(lambda));
    plot(mseTes(:,j))
    plot(mseTrs(:,j))
    hold off
end
