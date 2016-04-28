function [out] = Interleaving (in, n, l)

    % interleave n array of length l into a single array of length n*l


    out = zeros(n*l,1);
    for i=1:n
        for j=1:l
            out(i+n*(j-1))=in(i,j);
        end
    end





end