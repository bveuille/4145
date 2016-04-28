function [ H, G ] = ldpcHGgenerator( n, k )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


%H=[1 1 0 1 1 0 0 1 0 0 ; 0 1 1 0 1 1 1 0 0 0 ; 0 0 0 1 0 0 0 1 1 1 ; 1 1 0 0 0 1 1 0 1 0 ; 0 0 1 0 0 1 0 1 0 1 ];
%G=ldpcHtoG(H);


% big issue with checks invloving only one variable
% need to enforce the number of bit per check and check per bit
if 1
density=0.1;
A=rand(n-k,k);
A=A<density;
end




Ih=eye(n-k);
Ig=eye(k);
H=[A Ih];
G=[Ig A.'];



end

