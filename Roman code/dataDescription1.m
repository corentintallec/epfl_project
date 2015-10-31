% Load data
clear all;
load('Rome_classification.mat');

%% Plot y histogramm
figure(1);
xbins2 = [-2 -1 0 1 2];
hist(y_train, xbins2);
hy = ylabel('Frequency');
hx = xlabel('y');
set(gca,'fontsize',20,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
grid on;
print('HistX','-dpng')
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
boxplot(X_train);
hy = ylabel('');
hx = xlabel('X input variables');
set(gca,'fontsize',12,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy],'fontsize',12,'fontname','avantgarde','color',[.3 .3 .3]);
grid on;
print('boxplotX','-dpng')



