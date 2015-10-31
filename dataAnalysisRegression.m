data = load('Rome_regression');
trX = data.X_train;
trY = data.y_train;
teX = data.X_test;
label='cor1'
N = size(trY,1);
f = size(trX,2);

switch label
    case 'boxplot'
        boxplot(trX);
        title('Box plot for train data');
        set(gca,'xtick',[]);
        hx = xlabel('Features');
        hy = ylabel('');
    case 'yhist'
        hist(trY,sqrt(N));
        title('Y training set histogram');
        hx = xlabel('Y value');
        hy = ylabel('Frequency');
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
        hx = xlabel('Feature value');
        hy = ylabel('Frequency');
    case 'xhist66'
        hist(trX(:,66),sqrt(N));
        title('Feature 66');
        hx = xlabel('Feature value');
        hy = ylabel('Frequency');
    case 'cor1'
        scatter(trX(:,1),trY);
        title('Y vs first feature');
        hx = xlabel('First feature');
        hy = ylabel('Y');
end

% the following code makes the plot look nice and increase font size etc.
set(gca,'fontsize',20,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
grid on;

