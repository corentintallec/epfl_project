function beta = penLogisticRegression(y, tX, alpha, lambda)
% Penalized logistic regression using Newton's method
% lambda is the regularization parameter

maxIter = 1000; % number of iteration
beta = zeros(size(tX,2),1); % initialize beta
convergence = 1e-5; % convergence threshold
m = size(y,1); % number of data vectors
for i = 1:maxIter
     
     % Calculate gradient
     g = 1./m * tX' *(sigmoid(tX*beta) - y);
     
     % Calculate Hessian
     ybar = sigmoid(tX*beta);
     S = ybar .* (1. - ybar) + 1e-5;
     Id = eye(size(tX,2));
     Id(1,1) = 0;
     H = 1./m * tX' * diag(S) * tX + (lambda/m).*Id;
    
     % Check convergence
     if g'*g < convergence; break; end;
     
     % Calculate cost function for debugging
     L =  -1/m *( y'*tX*beta - sum(log(1 + exp(tX*beta))) );
     
     % Calculate beta
     beta = beta - alpha.*H\g;
end
L
i
end

