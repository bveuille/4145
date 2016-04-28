function [ out ] = ldpcDec( in, H, countM)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

debug=1;

count=0;

m=size(H,1);    % Number of check bits in message
n=size(H,2);    % Number of bits in codeword
k=n-m;




while and( sum(ldpcSyndrom(in,H)) >0 , count<countM )
    count=count+1;
    
    
    % Find the checks that are not respected
    syndrom=ldpcSyndrom(in, H);

    
    if(debug)
        count
        syndrom
        sumSyndrom=sum(syndrom)
    end
    
    % For each bit count the number of checks respected and not respected
    res=zeros(1,n);
    notRes=zeros(1,n);
    
    for bit=1:n
        for check=1:m
            if H(check, bit)==1
                if syndrom(check)==1
                    notRes(bit)=notRes(bit)+1;
                else
                    res(bit)=res(bit)+1;
                end
            end
        end
    end
    
    % if more not respected flip the bit
    for bit=1:n
        if notRes(bit)>res(bit)
            in(bit)=mod(in(bit)+1,2);
            if debug
                BIT=bit
                notRespected=notRes(bit)
                respected=res(bit)
            end
        end
    end
end

out=in;

end

