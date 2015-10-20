function L = computeCost(y, tX, beta)
% Compute the MSE
    N = length(y); %compute number of data points
    e = y - tX*beta; %compute the error of the model
    L = e'*e/(2*N); %compute MSE cost functions
end

