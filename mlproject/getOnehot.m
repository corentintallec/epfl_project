function out = getOnehot(in,ncat)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    N = size(in,1);
    out = zeros(N,ncat);
    for i=1:N
        out(i,in(i)+1) = 1;
    end
end

