run('loadAndTreat');

nlambda = 500;
lambda = logspace(-8,3,nlambda);
option = 'kFold';
trErs = [];
teErs = [];
k = 4;

for j=1:nlambda
    [teEr,trEr] = kFold(yTr,xTr,k,@(y,x) ridgeRegression(y,x,lambda(j)),@computeCostLS);
    trErs = [trErs trEr];
    teErs = [teErs teEr];
end

subplot(2,1,1);
semilogx(lambda,trErs);
hx = xlabel('lambda');
hy = ylabel('RMSE');
title('Training error');
ylim([0.3 0.4]);
set(gca,'fontsize',20,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
grid on;
subplot(2,1,2);
semilogx(lambda,teErs,'r');
hx = xlabel('lambda');
hy = ylabel('RMSE');
title('Test error');
ylim([0.3 0.4]);
set(gca,'fontsize',20,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
grid on;