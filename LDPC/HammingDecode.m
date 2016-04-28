function [out, errorFlag] = HammingDecode (in)
    
    
    errors = checkParity(in);
    errorFlag=false;
    
    if sum(errors)==1
        errorFlag=true;
    end
    if sum(errors)==2
        if errors(1)==1&&errors(2)==1
            in(1)=1-in(1);
        end
        if errors(1)==1&&errors(3)==1
            in(2)=1-in(2);
        end
        if errors(2)==1&&errors(3)==1
            in(3)=1-in(3);
        end
    end
    if sum(errors)==3
        in(4)=1-in(4);
    end
    
    for i=1:4
        out(i)=in(i);
    end

end

function [error] = checkParity (in)
    error=[0,0,0];
    if ( not ( mod ( in(1) + in(2) + in(4) + in(5) , 2 ) == 0 ))
        error(1)=1;
    end
    if ( not ( mod ( in(1) + in(3) + in(4) + in(6) , 2 ) == 0 ))
        error(2)=1;
    end
    if ( not ( mod ( in(2) + in(3) + in(4) + in(7) , 2 ) == 0 ))
        error(3)=1;
    end
end
