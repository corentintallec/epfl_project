data = load('Rome_classification');

tX = data.X_train;
tX = normalize(tX);

tY = data.y_train;

alpha = 0.00001;

beta = logisticRegression(tY,tX,alpha);

ypred = sigmoid(tX*beta)>0.5;

tX1 = tX(ypred == 1,:);

tX2 = tX(ypred == 0,:);

scatter3(tX1(:,1),tX1(:,2),tX1(:,3));

hold on

scatter3(tX2(:,1),tX2(:,2),tX2(:,3));

hold off

