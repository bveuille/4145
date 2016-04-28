function [ out ] = reedDec( in )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

g=[1 0]
r=mod(deconv(in,g),2)
if r==[0 0 0 0 0 0]
    out=in(1:4)
    return
end


end

