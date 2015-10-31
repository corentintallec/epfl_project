function loss = logLoss(y_t, y_pred)
% Log Loss error calculation
    y_pred(y_pred > 0.99999) = 0.99999;  
    m = size(y_t,1);
    loss = (-1/m) * sum(y_t.*log(y_pred) + (1-y_t).*log(1-y_pred));
end

