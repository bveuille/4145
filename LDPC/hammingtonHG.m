function [ H, G ] = hammingHG( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


H=[ 1 1 0 1 1 0 0 ;
    1 0 1 1 0 1 0 ;
    0 1 1 1 0 0 1 ]

G=[ 1 0 0 0 1 1 0 ;
    0 1 0 0 1 0 1 ;
    0 0 1 0 0 1 1 ;
    0 0 0 1 1 1 1 ]

H=[ 1 1 0 1 1 0 0 ;
    0 1 1 0 1 1 0 ;
    1 0 1 0 1 0 1 ]

end

