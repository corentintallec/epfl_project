data = load('Rome_regression');
tX = data.X_train;
tY = data.y_train;
hist(tY,50);
feature_number = size(tX,2);
figure
for i=1:feature_number
    subplot(ceil(sqrt(feature_number)),ceil(sqrt(feature_number)),i);
    hist(tX(:,i),50);
    title(strcat('feature ',num2str(i)));
    set(gca,'xtick',[]);
    set(gca,'xticklabel',[]);
    set(gca,'ytick',[]);
    set(gca,'yticklabel',[]);
end