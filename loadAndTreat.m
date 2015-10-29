data = load('Rome_regression.mat');

option = 'poly'

xTr = data.X_train;
yTr = data.y_train;
xTe = data.X_test;

switch option
    case 'poly'
        degree = 10;
        x49 = xTr(:,49);
        x66 = xTr(:,66);
        xTr = [];
        for k=1:degree
            xTr = [xTr x49.^k];
            xTr = [xTr x66.^k];
        end
    otherwise
        catf = [2 3 7 12 47 57 61 67 73];
        catnf = [3 3 4 4 3 4 4 3 3];

        xcat = xTr(:,catf);

        xTr(:,catf) = [];

        for i=1:size(catf,2)
            xTr = [xTr getOnehot(xcat(:,i),catnf(i))];
        end
end

xTr = normalize(xTr);
yTr = normalize(yTr);