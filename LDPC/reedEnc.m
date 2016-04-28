function [ out ] = reedEnc( in )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

g=[1 0]
r=mod(deconv(in,g),2)
out=cat(2,in,r)

end

