function [ out ] = uLawDecode( x, mu )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

out = 1+mu;
out = out^abs(x);
out = out-1;
out = sign(x)*out/mu;

end

