
k=10;   % Message length
wc=4;
wr=8;

m=k/(wr/wc-1);
n=m+k;


% double square
k=80;
n=2*k;
m=k;



%H=Hexemple()
%H=ldpcCheckMatrix2(k,wc,wr);


HGfound=1;
if not(HGfound)
    for i=0:100000
    
        i
        %matrix=randi([0 1],m,n);
        %matrix=rand(m,n);
        %matrix=matrix<=wc/n;
        %matrix=double(matrix);
        
        matrix=ldpcCheckMatrix(n, wc, wr);
        
        if 1
            for col=1:n
                r=randi([1 m]);
                r=mod(col-1,m)+1;
                matrix(r,col)= mod(matrix(r,col)+1, 2);
            end
        end
        
         
        
        if mod(det(matrix(:,1:m)),2)==1
            i
            fprintf('found det=1\n');
            
            if 0
                for col=1:n
                    r=randi([1 m]);
                    matrix(r,col)= mod(matrix(r,col)+1, 2);
                end
            end

            %if mod(det(matrix(:,1:m)),2)==1
                %fprintf('found det=1\n');

            tot=1;
            iteration=0;
            while tot>0
                tot=0;
                iteration=iteration+1
                if iteration>100
                    break;
                end
                for col1=1:n
                    for col2=col1+1:n
                        correlation = 2* sum( and( matrix(:,col1)==matrix(:,col2) , matrix(:,col1)==ones(m,1) )) /  (sum(matrix(:,col1))+sum(matrix(:,col2)));
                        %correlation = sum( and( matrix(:,col1)==matrix(:,col2) , matrix(:,col1)==ones(m,1) ));
                        if correlation > 0.5
                            tot=tot+1;
                            fprintf('col1: %d col2: %d correlation: %d det: %d\n',col1,col2,correlation,mod(det(matrix(:,1:m)),2))
                            save=matrix;
                            for row=1:m
                                if and( matrix(row,col1)==1, matrix(row,col2)==1 )
                                    matrix(row,col2)=0;
                                    break;
                                end
                            end
                            r2=randi([1 m]);
                            while or(matrix(r2,col1)==1, matrix(r2,col2)==1)
                                r2=randi([1 m]);
                                fprintf('r2');
                            end
                            matrix(r1,col1)=1;
                            matrix(r2,col2)=1;
                            if not(mod(det(matrix(:,1:m)),2)==1)
                                matrix=save;
                            end
                        end
                    end
                end
                tot;
            end
            fprintf('decorrelation over');
            if mod(det(matrix(:,1:m)),2)==1
                fprintf('det=1 was kept\n');
                
                colUnder=0;
                colOver=0;
                lineUnder=0;
                lineOver=0;
                if 0
                    colUnder=sum(sum(matrix)<wc*ones(1,n))
                    colOver=sum(sum(matrix)>2*wc*ones(1,n))
                    lineUnder=sum(sum(matrix,2)<wr*ones(m,1))
                    lineOver=sum(sum(matrix,2)>2*wr*ones(m,1))
                end

                if not(colUnder+colOver+lineUnder+lineOver)
                    [H Hr Hrr G]=ldpcHtoG2(matrix);
                    fprintf('matrix within bounds\n');
                    if isequal( Hrr(:,1:k), eye(k) )
                        fprintf('reduced row achieved\n');
                        HtimeG=mod(G*H.',2);
                        if isequal(  HtimeG, zeros(k) )
                            fprintf('H and G orthogonal\n');
                            HGfound=true;
                            break;
                        end
                    end
                end
            end
        end
    end
end

if HGfound

    H;
    G;

    %[H, G] = ldpcHGgenerator(n,k);  % Check and encoding matrix
    %[H, G] = hammingtonHG();


    p=0.01;     % Noise probability on channel
    Nnoise=3;   % Number of ones in the noise
    
    noise=rand(1, n);
    noise=noise<p;
    noise=zeros(1,n-Nnoise);
    noise=[ones(1,Nnoise), noise];

    message=randi([0 1], 1, k)
    enc=ldpcEnc(message,G)
    rec=mod(enc+noise,2)

    
    itMax=3;
    for it=1:itMax
        it
        dec=ldpcDec(rec, H, it, true);
        decodedRigth=sum(enc==dec)
        receivedRight=sum(enc==rec)
    end
end