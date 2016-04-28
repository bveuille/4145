



function [ count ] = prim( n )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

x=n*n
count=0
while not(x==n)
    x=mod(x*n,255)
    count=count+1;
    if count>500
        return
    end
end

