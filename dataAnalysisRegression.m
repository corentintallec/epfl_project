data = load('Rome_regression');
trX = data.X_train;
trY = data.y_train;
teX = data.X_test;
label='boxplot'
N = size(trY,1);
f = size(trX,2);

switch label
    case 'boxplot'
        boxplot(trX);
        title('Box plot for train data');
        set(gca,'xtick',[]);
        xlabel('Features');
    case 'yhist'
        hist(trY,sqrt(N));
        title('Y training set histogram');
        xlabel('Y value');
        ylabel('Frequency');
    case 'xhist'
        for i=1:f
            subplot(ceil(sqrt(f)),ceil(sqrt(f)),i);
            hist(trX(:,i),sqrt(N));
            title(strcat('Feature ',num2str(i)))
            set(gca,'xtick',[]);
            set(gca,'ytick',[]);
        end
    case 'xhist49'
        hist(trX(:,49),sqrt(N));
        title('Feature 49');
        xlabel('Feature value');
        ylabel('Frequency');
    case 'xhist66'
        hist(trX(:,66),sqrt(N));
        title('Feature 66');
        xlabel('Feature value');
        ylabel('Frequency');
end

