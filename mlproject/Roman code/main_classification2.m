clear all;
load('Rome_classification');
%% Dummy encoding
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

%% split data in K fold (we will only create indices)
setSeed(1);
K = 4;
N = size(y_train,1);
idx = randperm(N);
Nk = floor(N/K);
for k = 1:K
    idxCV(k,:) = idx(1+(k-1)*Nk:k*Nk);
end

%% K-fold cross validation
alpha = 1.0;
binLossTe = zeros(K,1);
binLossTr = zeros(K,1);
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
    beta = penLogisticRegression(yTr, tXTr, alpha, 0.3);

    % Prediction
    trPr = sigmoid(tXTr*beta);
    tePr = sigmoid(tXTe*beta);
    trBin = +(trPr >= 0.5);
    teBin = +(tePr >= 0.5);

    % Error calculation
    binLossTr(k) = binLoss(yTr, trBin);
    binLossTe(k) = binLoss(yTe, teBin);
end
toc
% Mean error calculation

binLossTrMean = mean(binLossTr)
binLossTeMean = mean(binLossTe)

%% Test dataset prediction
classifiedFeatures = [3 16 25 28 34];
classifiedRows = [];
for i = 1:length(classifiedFeatures)
    classifiedRows = [classifiedRows dummyvar(X_test(:,classifiedFeatures(i)))];
end
X_test(:,classifiedFeatures) = [];
X_test = [X_test classifiedRows];

Xt = poly(X_test,3);
Xt = normalize(Xt);
tXRes = [ones(size(Xt,1),1) Xt];

%% Write prediction result to csv file
test_prediction = sigmoid(tXRes*beta);
csvwrite('predictions_classification.csv',test_prediction);


