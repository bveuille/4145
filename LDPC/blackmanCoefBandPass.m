function [ h ] = blackmanCoefBandPass( f1, f2, fs, N )
%blackManCoefBandpass
%   Calculate the coefficients of a bandpass filter between f1 and f2, with
%   sampling rate fs and order N, using a Blackman window
%   Uses method from mikroe.con, validated with their exemple

for i=0:N
    w(i+1) = 0.42 - 0.5*cos(2*pi*i/N) + 0.08*cos(4*pi*i/N);
end

M=N/2;
wc1=2*pi*f1/fs;
wc2=2*pi*f2/fs;

for i=0:N
    hd(i+1) = sin(wc2*(i-M))/(pi*(i-M)) - sin(wc1*(i-M))/(pi*(i-M));
end
hd(M+1) = (wc2-wc1)/pi;

h=w.*hd;

sum=0;
for i=0:N
    sum=sum+abs(h(i+1));
end
for i=0:N
    h(i+1)=h(i+1)/sum;
end


end

