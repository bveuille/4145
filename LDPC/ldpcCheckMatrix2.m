function [ out ] = ldpcCheckMatrix2( k, wc, wr )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    % k  : length of message
    % wc : checks per bit
    % wr : bits per check
    
    % typically wc=4 wr=6;
    
    m=k/(wr/wc-1);
    n=m+k;

    % should verify
    % m/wc = k/wr integer

    
    
    % MacKay and Neal method
    
    completed=false;
    while not(completed)
        completed=true;
        H=zeros(m,n);
        for col=1:n
            free=sum(H,2);
            free=free<wr;
            if sum(free)<wc
                col;
                free;
                H;
                completed=false;
                break;
            end
            H(:,col)=randomCol(wc, m, free);
        end
    end
    out=H;

end


% Generate a random column of length m,
% with wc 1s only distributed on the free lines 

function [out] = randomCol(wc, m, free)

    out=zeros(1,m);

    i=1;
    count=0;
    while and(i<=m,count<wc)  
        if free(i)
            out(i)=1;
            count=count+1;
        end
        i=i+1;
    end

    if count<wc
        out=-1;
        return;
    end

    r=randi([1 m],2,10*m);
    for i=1:10*m
        if and(free(r(1,i)), free(r(2,i)))
            tmp=out(r(1,i));
            out(r(1,i))=out(r(2,i));
            out(r(2,i))=tmp;
        end
    end

end


    
