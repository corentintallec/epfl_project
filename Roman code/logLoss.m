function loss = logLoss(y, y_pred)
% Log Loss error calculation
    m = size(y,1);
    y_pred = y_pred + 1e-5;    
    loss = (-1/m) * sum(y.*log(y_pred) + (1.-y).*log(1.-y_pred));
end

