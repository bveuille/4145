function [ out ] = uLawCode( x, mu)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


out = log(1 + mu*abs(x));
out = out/log(1+mu);
out = out*sign(x);

end

