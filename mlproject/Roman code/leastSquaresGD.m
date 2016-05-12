function beta = leastSquaresGD(y,tX,alpha)
% Least squares using gradient descent
% alpha is step size

    maxIters = 1000; % number of iterations
    converged = 1e-5; %number for convergence check
    N = length(y); % compute number of data points
    beta = zeros(size(tX,2),1); % initiate beta
    
    for k = 1:maxIters
        % compute the error of the model
        e = y - tX*beta; 

        % compute gradient
        g = ((-1)/N)*tX'*e;

        % compute cost function
        L = e'*e/(2*N);

        % update beta
        beta = beta - alpha .*g;

        % check for convergence
        if g'*g < converged; break; end;
    end
    
end

