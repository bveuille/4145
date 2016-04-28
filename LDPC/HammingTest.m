function [] = HammingTest ()
    n=0
    for a=0:1
        for b=0:1
            for c=0:1
                for d=0:1
                    in=[a,b,c,d];
                    for i=1:7
                        noise=[0,0,0,0,0,0,0];
                        noise(i)=1;
                        [out,errorFlag,success]=HammingTestUnit(in, noise);
                        if (not(success))
                            disp('erreur')
                            in
                            noise
                        end
                    end
                end
            end
        end
    end

end


function [ out, errorFlag, success ] = HammingTestUnit( in , noise)

    s = HammingCode(in);
    s = mod(s+noise,2);
    [ out , errorFlag ] = HammingDecode(s);
    success = isequal(in,out);

end