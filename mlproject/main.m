
data = load('Rome_regression');
tX = data.X_train;
tY = data.y_train;
tX = normalize(tX);
tY = normalize(tY);
[maeTe,maeTr] = kFold(tY,tX,4,@leastSquares,@computeCostLS)


