function [ out ] = ldpcSyndrom( message, matrixH )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

out=mod(matrixH*message.',2);

end

