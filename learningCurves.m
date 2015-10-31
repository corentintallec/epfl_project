run('loadAndTreat');

nsample = 30;
N = size(xTr,1);
p = 0.8;
lambda=1e-6;
trxTr = xTr(1:ceil(p*N),:);
texTr = xTr(ceil(p*N)+1:N,:);
tryTr = yTr(1:ceil(p*N),:);
teyTr = yTr(ceil(p*N)+1:N,:);
props = linspace(0,1,100);

trerrs = zeros(nsample,100);
teerrs = zeros(nsample,100);
for n=1:nsample
    for j=1:100 
        trtrxTr = trxTr(1:ceil(props(j)*p*N),:);
        trtryTr = tryTr(1:ceil(props(j)*p*N),:);
        beta = ridgeRegression(trtryTr,trtrxTr,lambda);
        trerrs(n,j) = computeCostLS(trtryTr,trtrxTr,beta);
        teerrs(n,j) = computeCostLS(teyTr,texTr,beta);
    end
    A = randperm(size(trxTr,1));
    trxTr = trxTr(A,:);
    tryTr = tryTr(A,:);
end

figure(1);
boxplot(trerrs,'plotstyle','compact',...
    'symbol','k.',...
    'medianstyle','line');
hold on;
boxplot(teerrs,'plotstyle','compact',...
    'symbol','k.',...
    'medianstyle','line','colors','r');
hold off;

ylim([0.15 0.3]);

hx = xlabel('Train data proportion');
hy = ylabel('RMSE');

% the following code makes the plot look nice and increase font size etc.
set(gca,'fontsize',20,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
grid on;
        