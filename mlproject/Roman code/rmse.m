function rmse = rmse(y,y_pred)
% Compute RMSE for regression problem
    m = length(y);
    mse = (1/m) * sum((y-y_pred).^2);
    rmse = sqrt(mse);
end

