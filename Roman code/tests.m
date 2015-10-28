clear all;
%load('height_weight_gender');
load('Rome_classification');

% X = [height weight];
% X = normalize(X);
% tX = [ones(size(X,1),1) X];
% y = +gender; 

X = normalize(X_train);
tX = [ones(size(X_train,1),1) X_train];
y = (y_train == 1); 


%% Data spliting
[tXTr, yTr, tXTe, yTe] = split(y, tX, 0.8);

%% My impletation
tic
beta = penLogisticRegression(yTr, tXTr, 1.0, 0.01);
toc

%% Builtin solution
options = optimset('GradObj', 'on', 'MaxIter', 400);
initial_theta = zeros(size(tXTr,2),1);

%  Run fminunc to obtain the optimal theta
[theta, cost] = ...
	fminunc(@(t)(costFunctionRegNg(t, tXTr, yTr,0.01)), initial_theta, options);
cost
%% Prediction
myTe = +sigmoid(tXTe*beta)>=0.5;
ngTe = +sigmoid(tXTe*theta)>=0.5;

%% Errors calculation
myRmse = rmse(yTe, sigmoid(tXTe*beta))
ngRmse = rmse(yTe, sigmoid(tXTe*theta))
myBin = binLoss(yTe, myTe)
ngBin = binLoss(yTe, ngTe)
myLog = logLoss(yTe, sigmoid(tXTe*beta))
ngLog = logLoss(yTe, sigmoid(tXTe*theta))
   