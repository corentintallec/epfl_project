function bin_loss = binLoss(y, y_pred)
% 1/0 loss error calculation
    n = size(y_pred,1);
    I = zeros(n,1);
    for i = 1:n
        if y(i) ~= y_pred(i)
            I(i,1) = 1;  
        end
    end
    bin_loss = 1/n * sum(I);
end

