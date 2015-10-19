function [test_error,train_error] = kFold(tY,tX,k,reg,error)
%KFOLD Summary of this function goes here
%   Detailed explanation goes here
    N = size(tX,1);
    batch_size = floor(N./k);
    test_errors = [];
    train_errors = [];
    for i = 1:k
        trainX1 = tX(1:(i-1)*batch_size,:);
        trainX2 = tX(i*batch_size:end,:);
        trainY1 = tY(1:(i-1)*batch_size,:);
        trainY2 = tY(i*batch_size:end,:);
        trainX = [trainX1;trainX2];
        trainY = [trainY1;trainY2];
        testX = tX((i-1)*batch_size+1:i*batch_size,:);
        testY = tY((i-1)*batch_size+1:i*batch_size,:);
        beta = reg(trainY,trainX);
        test_errors = [test_errors error(testY,testX,beta)];
        train_errors = [train_errors error(trainY,trainX,beta)];
    end
    test_error = mean(test_errors);
    train_error = mean(train_errors);
end

