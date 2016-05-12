clear all;
load('Rome_classification');

% X = [height weight];
% X = normalize(X);
% tX = [ones(size(X,1),1) X];
% y = +gender; 

X = normalize(X_train);
X = poly(X,5);
X = normalize(X);
tX = [ones(size(X_train,1),1) X_train];
y = (y_train == 1); 


%% Data spliting

[tXTr, yTr, tXTe, yTe] = split(y, tX, 0.75);


%% My impletation

% tic
% beta = penLogisticRegression(yTr, tXTr, 1.0, lambda);
% toc
lambda = 0.001;
tic
beta = penLogisticRegression(yTr, tXTr, 1,lambda);
toc

%% Prediction
myTr = +sigmoid(tXTr*beta)>=0.5;
myTe = +sigmoid(tXTe*beta)>=0.5;

% Errors calculation
myBinTr = binLoss(yTr, myTr)
myBinTe = binLoss(yTe, myTe)

%% Builtin solution
options = optimset('GradObj', 'on', 'MaxIter', 400);
initial_theta = zeros(size(tXTr,2),1);

%  Run fminunc to obtain the optimal theta
[theta, cost] = ...
	fminunc(@(t)(costFunctionRegNg(t, tXTr, yTr, lambda)), initial_theta, options);
cost