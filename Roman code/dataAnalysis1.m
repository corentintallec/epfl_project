% Load data
clear all;
load('Rome_regression.mat');

% plot data histogram
%figure(1);
%hist(y_train,100);
%title('y train')

% plot all X dimensions
%figure(2);
%for i = 1:77
%    subplot(10,8,i);
%    hist(X_train(:,i),100);
%end
    

%figure(3);
%boxplot(X_train(:,:));

%% Classified data
% Binary data [0,1]: idx = 9,39,58,61
idx_zero = [9 39 58 61];
% Classes [0,2] : idx = 73
% Classes [1,2] : idx = 3, 47
% Classes [0, 2, 1] : idx = 2, 57, 67
% Classes [0, 1, 2, 3] : idx = 7, 12
idx_classes = [73 3 47 2 57 67 7 12];
%% 
% Clean classified data
idx_X_train = 1:size(X_train,2);
idx_X_train([idx_zero idx_classes]) = [];
X_train_cleaned = X_train(:,idx_X_train);

% Find outliers
idxOutliers = [];
for i = 1:size(X_train,2)
    if i ~= 66
       continue;
    end
    x = X_train(:,i);
    meanX = mean(x);
    stdX = std(x);
    x_norm = x- meanX;
    x_out = x_norm(x_norm>3*stdX | x_norm< -3*stdX);
    idxOutliersCurrent = find(x_norm>3*stdX | x_norm< -3*stdX);
    idxOutliers = union(idxOutliers, idxOutliersCurrent);
end




