function [ out ] = bchCode( in )
%   bch(127,64)
%   Detailed explanation goes here

n=127;
m=7;
t=10;
a=2;
modulo=2^n;

%Calculate g as product of (x-a^i) for a=2, i from 1 to 2*t

g=zeros(1,2*t+1);
g(1)=1;
for i=1:2*t
    ai=a^i;
    temp=g;
    temp(1)=g(1)*ai;
    for j=2:2*t+1
        temp(j)=g(j)*ai+g(j-1);
    end
    g=mod(temp,modulo)
end
g=mod(g,modulo)


h=cat(2,in,zeros(1,63));
red = mod(deconv(h,g),2);
out = cat(2,in,red);

if 0
size(in)
size(h)
size(g)
size(red)
size(out)
end

end

