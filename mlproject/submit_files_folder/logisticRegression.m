function beta = logisticRegression(y,tX,alpha)
%Logistic regression using Newton's method.

maxIter = 1000; % number of iteration
beta = zeros(size(tX,2),1); % initialize beta
convergence = 1.0e-05; % convergence threshold
m = length(y); % number of data vectors

for i = 1:maxIter
     % Calculate gradient
     g = 1./m * tX' *(sigmoid(tX*beta) - y);
          
     % Calculate Hessian
     ybar = sigmoid(tX*beta);
     S = ybar .* (1. - ybar) + 1e-5;
     H = 1/m * tX' * diag(S) * tX;
              
     % Check convergence
     if g'*g < convergence; break; end;
     
     % Calculate cost function for debugging
     L =  -1/m *( y'*tX*beta - sum(log(1 + exp(tX*beta))) );
          
     % Calculate beta
     beta = beta - alpha.*g;
end
end

