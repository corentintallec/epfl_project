function tXpoly = poly(tX,n)
    tXpoly = zeros(size(tX,1),n);
    tXpoly(:,1) = tX;
    for i=2:n
        tXpoly(:,i) = tX.^i;
    end
end