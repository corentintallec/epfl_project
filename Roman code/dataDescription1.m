% Load data
clear all;
load('Rome_classification.mat');

%% Plot y histogramm
figure(1);
hist(y_train,100);

%% Plot X_train histograms
figure(2);
for i = 1:size(X_train,2)
    subplot(7,5,i);
    hist(X_train(:,i), 100);
    title(i);
end

%% Plot two random variables
figure(3);
for i = 1: 12
    h = randi(34);
    j = randi(34);
    subplot(4,3,i);
    plot(X_train((y_train==1),h),X_train((y_train==1),j), 'k+', 'LineWidth',2, 'MarkerSize',7);
    hold on;
    plot(X_train((y_train==-1),h), X_train((y_train==-1),j), 'ko','MarkerFaceColor', 'y', 'MarkerSize',7);
end

%% Plot boxplot
figure(4);
subplot(2,1,1);
boxplot(X_train);
title('As-is data');
subplot(2,1,2);
X = normalize(X_train);
boxplot(normalize(X_train));
title('Normalized data');



