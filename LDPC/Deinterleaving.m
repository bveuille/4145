function [out] = Deinterleaving (in, n, l)

    % deinterleave an array of length n*l into n arrays of length l

    
    out = zeros(n,l);
    for i=1:n
        for j=1:l
            out(i,j)=in(i+n*(j-1));
        end
    end





end