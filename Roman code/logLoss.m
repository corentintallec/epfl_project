function logLoss = logLoss(y, y_pred)
% Log Loss error calculation
    m = length(y);
    logLoss = 1/m.*sum(y.*log(y_pred) + (1-y).*log(1-y_pred));
end

