% Load data
load('Rome_regression.mat');

% normalize features (store the mean and variance)
meanX = zeros(size(X_train,2));
stdX = zeros(size(X_train,2));
for i = 1:size(X_train, 2)
    meanX(i) = mean(X_train(:,i));
    X_train(:,i) = X_train(:,i) - meanX(i);
    stdX(i) = std(X_train(:,i));
    X_train(:,i) = X_train(:,i)./stdX(i);
end

% Normalization y
meanY = mean(y_train);
y_train = y_train - meanY;
stdY = std(y_train);
y_train = y_train./stdY;    


% split data in K fold (we will only create indices)
setSeed(1);
K = 4;
N = size(y_train,1);
idx = randperm(N);
Nk = floor(N/K);
for k = 1:K
	idxCV(k,:) = idx(1+(k-1)*Nk:k*Nk);
end


%% Feature engineering
% Binary data [0,1]: idx = 9,39,58,61
idx_zero = [9 39 58 61];
% Classes [0,2] : idx = 73
% Classes [1,2] : idx = 3, 47
% Classes [0, 2, 1] : idx = 2, 57, 67
% Classes [0, 1, 2, 3] : idx = 7, 12
idx_classes = [73 3 47 2 57 67 7 12];

% Clean classified data
idx_X_train = 1:size(X_train,2);
idx_X_train([idx_zero idx_classes]) = [];
X_train_1 = X_train(:,idx_X_train);

X_train(:,66) = X_train(:,66).^2;

%% K-fold cross validation
for k = 1:K
    % get k'th subgroup in test, others in train
	idxTe = idxCV(k,:);
	idxTr = idxCV([1:k-1 k+1:end],:);
	idxTr = idxTr(:);
	yTe = y_train(idxTe);
	XTe = X_train(idxTe,:);
	yTr = y_train(idxTr);
	XTr = X_train(idxTr,:);
        
	% form tX 
    tXTr = [ones(length(yTr), 1) XTr];
    tXTe = [ones(length(yTe), 1) XTe];
	
    % least squares 
    beta = leastSquares(yTr, tXTr);

    % training and test MSE
    rmseTrSub(k) = rmse(yTr,tXTr*beta);
		
	% testing MSE using least squares
	rmseTeSub(k) = rmse(yTe,tXTe*beta); 
end

rmseTr = mean(rmseTrSub);
rmseTe = mean(rmseTeSub);

fprintf('MSE Train: ');
rmseTr
fprintf('MSE Test: ');
rmseTe

