function tXpoly = poly(tX,n)
    tXpoly = [];
    for d = 1:size(tX,2)
        tXpolyFeature = zeros(size(tX,1),n);
        tXpolyFeature(:,1) = tX(:,d);
        for i = 2:n
            tXpolyFeature(:,i) = tX(:,d).^i;
        end
        tXpoly = [tXpoly tXpolyFeature];
    end
end