clear all;
load('Rome_classification');

classifiedFeatures = [3 16 25 28 34];
classifiedRows = [];
for i = 1:length(classifiedFeatures)
    classifiedRows = [classifiedRows dummyvar(X_train(:,classifiedFeatures(i)))];
end
X_train(:,classifiedFeatures) = [];
X_train = [X_train classifiedRows];
X = poly(X_train,3);
X = normalize(X);
y_train(y_train == -1) = 0;

xTr = X;
yTr = y_train;

%% Plot learning curve
tic
nsample = 30;
N = size(xTr,1);
p = 0.8;
lambda=0.3;
alpha = 1.0;
trxTr = xTr(1:ceil(p*N),:);
texTr = xTr(ceil(p*N)+1:N,:);
tryTr = yTr(1:ceil(p*N),:);
teyTr = yTr(ceil(p*N)+1:N,:);
props = linspace(0,1,100);

trerrs = zeros(nsample,100);
teerrs = zeros(nsample,100);
for n=1:nsample
    for j=1:100 
        trtrxTr = trxTr(1:ceil(props(j)*p*N),:);
        trtryTr = tryTr(1:ceil(props(j)*p*N),:);
        beta = penLogisticRegression(trtryTr,trtrxTr,alpha, lambda);
        trerrs(n,j) = computeCostLR(trtryTr,trtrxTr,beta);
        teerrs(n,j) = computeCostLR(teyTr,texTr,beta);
    end
    A = randperm(size(trxTr,1));
    trxTr = trxTr(A,:);
    tryTr = tryTr(A,:);
end
toc
%%
figure(1);
boxplot(trerrs,'plotstyle','compact');
figure(2)
boxplot(teerrs,'plotstyle','compact','colors','r');
hold off;
