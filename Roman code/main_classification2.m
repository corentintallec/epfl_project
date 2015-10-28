clear all;
load('Rome_classification');

% Parameters
alpha = 1.0;
X = normalize(X_train);
y_train(y_train == -1) = 0;

%% split data in K fold (we will only create indices)
setSeed(1);
K = 4;
N = size(y_train,1);
idx = randperm(N);
Nk = floor(N/K);
for k = 1:K
    idxCV(k,:) = idx(1+(k-1)*Nk:k*Nk);
end

%% Features engineering
X = normalize(X_train);
classifiedFeatures = [3 16 25 28 34];

X = poly(X,2);
X = normalize(X);

%% K-fold cross validation
tic
for k = 1:K
    idxTe = idxCV(k,:);
    idxTr = idxCV([1:k-1 k+1:end],:);
	idxTr = idxTr(:);
    yTe = y_train(idxTe);
    yTr = y_train(idxTr);
    XTe = X(idxTe,:);
    XTr = X(idxTr,:);
    tXTe = [ones(size(XTe,1),1) XTe];
    tXTr = [ones(size(XTr,1),1) XTr];
    

    % Model train
    beta = penLogisticRegression(yTr, tXTr, alpha, 0.1);

    % Prediction
    trPr = sigmoid(tXTr*beta);
    tePr = sigmoid(tXTe*beta);
    trBin = +(trPr >= 0.5);
    teBin = +(tePr >= 0.5);

    % Error calculation
    rmseTr(k) = rmse(yTr, trPr);
    rmseTe(k) = rmse(yTe, tePr);
    binLossTr(k) = binLoss(yTr, trBin);
    binLossTe(k) = binLoss(yTe, teBin);
    logLossTr(k) = logLoss(yTr, trBin);
    logLossTe(k) = logLoss(yTe, teBin);
end
toc
%% Mean error calculation
rmseTr = mean(rmseTr);
rmseTe = mean(rmseTe);
binLossTr = mean(binLossTr);
binLossTe = mean(binLossTe);
logLossTr = mean(logLossTr);
logLossTe = mean(logLossTe);
[rmseTr; rmseTe; binLossTr; binLossTe]
[logLossTr; logLossTe]

