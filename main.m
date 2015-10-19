
data = load('Rome_regression');
tX = data.X_train;
tY = data.y_train;
tX = normalize(tX);
tY = normalize(tY);
%tX = [ones(size(tX,1),1) tX];
N=size(tX,1);
PCA = pca(tX);
beta = ridge(tY,tX,1.);
beta1 = beta;
computeCostLS(tY,tX,beta)
%scatter(tX*PCA(:,1),tY);
%hold on;
%beta_pca = beta'*PCA(:,1);
%beta_pca_two = beta'*PCA(:,1:2);
%size(beta_pca_two)

%plot(linspace(-10,10,100),beta_pca*linspace(-10,10,100));
%figure;
%hold on
%scatter3(tX*PCA(:,1),tX*PCA(:,2),tY);
[X,Y] = meshgrid(-10:0.1:10,-10:0.1:10);
Z = beta_pca_two(1) * X + beta_pca_two(2)*Y;
%surf(X,Y,Z);
sep = separate(beta,tX,tY);
dataX1 = tX(find(sep==1),:);
dataX2 = tX(find(sep==0),:);
dataY1 = tY(find(sep==1),:);
dataY2 = tY(find(sep==0),:);
%scatter3(dataX1*PCA(:,1),dataX1*PCA(:,2),dataY1);
%scatter3(dataX2*PCA(:,1),dataX2*PCA(:,2),dataY2);
%plotRidge(tY,tX,10,lambda_range);

tX = [sep tX];
beta = leastSquares(tY,tX);
computeCostLS(tY,tX,beta)
computeCostLS(tY,tX,[0;beta1])

