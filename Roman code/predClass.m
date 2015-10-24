function yPred = predClass(tX, beta)
% Make prediction for logistic regression
m = length(tX);
yPred = zeros(m,1);
yLog = sigmoid(tX*beta);
for i = 1:m
    if yLog(i) > 0.5
        yPred(i,1) = 1;
    end
end



end

