function beta = logisticRegression(y,tX,alpha)
%Logistic regression using Newton's method.

maxIter = 3; % number of iteration
beta = zeros(size(tX,2),1); % initialize beta
convergence = 1e-5; % convergence threshold
m = length(y); % number of data vectors

 for i = 1:maxIter
     
     % Calculate gradient
     g = (1/m).*tX'*(sigmoid(tX*beta)-y);
     
     % Calculate Hessian
     S = diag(sigmoid(tX*beta).*(1-sigmoid(tX*beta)));
     %H = (1/m).* tX'*S*tX;
     H = (1/m).*tX'*S*tX;
     
     % Check convergence
     gradient = g'*g
     if g'*g < convergence; break; end
     
     % Calculate cost function for debugging
     L = (1/m).* sum(-y.*sigmoid(tX*beta)-(1-y).*(1 - sigmoid(tX*beta)));
     
     % Calculate beta
     beta = beta - alpha*H\g;
          
 end

end

