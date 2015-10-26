function beta = penLogisticRegression(y, tX, alpha, lambda)
% Penalized logistic regression using Newton's method
% lambda is the regularization parameter

maxIter = 1000; % number of iteration
beta = zeros(size(tX,2),1); % initialize beta
convergence = 1e-5; % convergence threshold
m = length(y); % number of data vectors

for i = 1:maxIter
     % Calculate gradient
     g = (1/m).*(tX'*(sigmoid(tX*beta)-y));
     
     % Calculate Hessian (with implemented regularization)
     S = diag(sigmoid(tX*beta).*(1-sigmoid(tX*beta)));
     Id = eye(size(tX,2));
     Id(1,1) = 0;
     %H = (1/m).* tX'*S*tX + (lambda/m).*Id;
     H = tX'*S*tX + (lambda/m).*Id;
     
     % Calculate cost function for debugging
     L = (1/m).* sum(-y.*sigmoid(tX*beta)-(1-y).*(1 - sigmoid(tX*beta))); 
     
     % Calculate beta
     beta = beta - alpha.*H\g;
     
     % Check convergence
     gradinent = g'*g
     if g'*g < convergence; break; end
end

end

