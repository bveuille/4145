function [out] = ldpcCheckMatrix( n, wc, wr )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


% Galager method
% Doesn't seem to works with echelonning

% should verify
% m/wc = k/wr integer


m=n*wc/wr;  % number of checks
k=n-m;  % number of bit coded

if not(m/wc == n/wr)
    out = -1;
    return
end


repeat=true;
% iterate until there are not two identical rows
while(repeat)

H=zeros(m,n);

% the first band
for row=1:m/wc
    for col=(row-1)*wr+1:row*wr
        H(row,col)=1;
    end
end

% the other bands as permutations of the first one
for band=1:wc-1
    r=randomRow(n);
    for row=1:m/wc
      for col=1:n
          H(band*m/wc+row,col)=H(row,r(col));
      end
   end
end

% check if identical rows
repeat=false;
for row1=1:m
    for row2=row1+1:m  
        if H(row1,:)==H(row2,:)
            repeat=true
        end
   end
end

end

out=H;
end



function [out] = randomRow(length)

out=zeros(1,length);
for i=1:length
   out(i)=i; 
end

r=randi([1 length],2,10*length);
for i=1:10*length
    tmp=out(r(1,i));
    out(r(1,i))=out(r(2,i));
    out(r(2,i))=tmp;
end

end


