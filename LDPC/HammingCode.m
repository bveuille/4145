function [out] = HammingCode (in)

    for i=0:3
        out(i+1) = in(i+1);
    end
    
    out(5) = mod ( in(1) + in(2) + in(4 ) , 2 );
    out(6) = mod ( in(1) + in(3) + in(4) , 2 );
    out(7) = mod ( in(2) + in(3) + in(4) , 2 );
    
end
