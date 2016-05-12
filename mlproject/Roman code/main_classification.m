% Load data
clear all;
load('Rome_classification.mat');

% % plot y histogramm
% figure(1);
% hist(y_train,100);
% 
% % plot X_train histograms
% figure(2);
% for i = 1:size(X_train,2)
%     subplot(7,5,i);
%     title(i);
%     hist(X_train(:,i), 100);
% end

% normalize features (store the mean and variance)
meanX = zeros(size(X_train,2),1);
stdX = zeros(size(X_train,2),1);
for i = 1:size(X_train, 2)
    meanX(i) = mean(X_train(:,i));
    X_train(:,i) = X_train(:,i) - meanX(i);
    stdX(i) = std(X_train(:,i));
    X_train(:,i) = X_train(:,i)./stdX(i);
end

alpha = 0.0001;
beta = logisticRegression(y_train,X_train,alpha);
%%
% % split data in K fold (we will only create indices)
% setSeed(1);
% K = 4;
% N = size(y_train,1);
% idx = randperm(N);
% Nk = floor(N/K);
% for k = 1:K
% 	idxCV(k,:) = idx(1+(k-1)*Nk:k*Nk);
% end

% %%
% % K-fold cross validation
% for k = 1:1
%     % get k'th subgroup in test, others in train
% 	idxTe = idxCV(k,:);
% 	idxTr = idxCV([1:k-1 k+1:end],:);
% 	idxTr = idxTr(:);
% 	yTe = y_train(idxTe);
% 	XTe = X_train(idxTe,4);
% 	yTr = y_train(idxTr);
% 	XTr = X_train(idxTr,4);
%         
% 	% form tX Warning: Matrix is singular, close to singular or badly scaled. Results may be inaccurate
%     tXTr = [ones(length(yTr), 1) XTr];
%     tXTe = [ones(length(yTe), 1) XTe];
% 	
%     % Logistic regression training
% %     beta = penLogisticRegression(yTr, tXTr,0.1,10000);
%     beta = logisticRegression(yTr, tXTr, 0.00001);
%    
%     % Make prediction 
%     yTrPred = predClass(tXTr,beta);
%     yTePred = predClass(tXTe,beta);
%     
%     % training and test errors calculation
%     % RMSE error
%     rmseTrSub(k) = rmse(yTr,sigmoid(tXTr*beta));
% 	rmseTeSub(k) = rmse(yTe,sigmoid(tXTe*beta)); 
%     % 1/0 loss error
%     binTrSub(k) = binLoss(yTr,yTrPred);
%     binTeSub(k) = binLoss(yTe,yTePred);
%     % Log loss error
%     logTrSub(k) = logLoss(yTr,sigmoid(tXTr*beta));
%     logTeSub(k) = logLoss(yTe,sigmoid(tXTe*beta));
%     
% end

% % RMSE error
% rmseTr = mean(rmseTrSub);
% rmseTe = mean(rmseTeSub);
% 
% % 1/0 loss error
% binTr = mean(binTrSub);
% binTe = mean(binTeSub);
% 
% % Log loss error
% logTr = mean(logTrSub);
% logTe = mean(logTeSub);
% 
% % Output errors
% rmseTr
% rmseTe
% 
% binTr
% binTe
% 
% logTr
% logTe

