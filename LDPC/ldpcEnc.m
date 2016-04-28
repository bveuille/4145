function [ out ] = ldpcEnc( message, matrixG)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

out=mod(message*matrixG,2)  ;

end

