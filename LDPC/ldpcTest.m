
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

HGfound=0;

if 1

HGfound=0;
for i=0:10000
    i
    %matrix=randi([0 1],m,n);
    %matrix=rand(m,n);
    %matrix=matrix<=wc/n;
    %matrix=double(matrix);
    
    matrix=ldpcCheckMatrix(n, wc, wr);
    for i=0:n-1
        matrix((mod(i,m)+1),i+1)= mod(matrix((mod(i,m)+1),i+1)+1, 2);
    end
    
    if mod(det(matrix(:,1:m)),2)==1
        fprintf('found det=1\n');
        
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
        
        tot=0;
        for col1=1:n
            for col2=col1+1:n
                correlation = 2* sum( and( matrix(:,col1)==matrix(:,col2) , matrix(:,col1)==ones(m,1) )) /  (sum(matrix(:,col1))+sum(matrix(:,col2)));
                if correlation > 0.5
                    tot=tot+1;
                    fprintf('col1: %d col2: %d correlation: %d\n',col1,col2,correlation)
                end
            end
        end
        tot
        
        if not(colUnder+colOver+lineUnder+lineOver)
            [H Hr Hrr G]=ldpcHtoG2(matrix);
            fprintf('matrix within bounds');
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

if HGfound

    H;
    G;

    %[H, G] = ldpcHGgenerator(n,k);  % Check and encoding matrix
    %[H, G] = hammingtonHG();


    p=0.05;  % Noise probability on channel

    noise=rand(1, n);
    noise=noise<p;
    %noise=zeros(1,n-3);
    %noise=[1, 1, 1, noise];

    message=randi([0 1], 1, k)
    enc=ldpcEnc(message,G)
    rec=mod(enc+noise,2)

    
    itMax=5;
    for it=1:itMax
        it
        %dec=ldpcDec(rec, H, it, false)
        decodedRigth=sum(enc==dec)
        receivedRight=sum(enc==rec)
    end
end