function xo = normalize( xi )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
    xo = (xi-ones(size(xi,1),1)*mean(xi,1))./(ones(size(xi,1),1)*std(xi,0,1));
end

