
k=10;   % Message length
wc=4;
wr=6;

m=k/(wr/wc-1);
n=m+k;


n=2*k;
m=k;


p=0.05;  % Noise probability on channel

%H=Hexemple()
%H=ldpcCheckMatrix2(k,wc,wr);

nb=0;
for i=0:1000    
    matrix=randi([0 1],m,n);
    if mod(det(matrix(:,1:m)),2)==1
        nb=nb+1;
        [H Hr Hrr G]=ldpcHtoG2(matrix)
        HtimeG=mod(G*H.',2)
        break
    end
end


sizeMatrix=size(H);
HtimeG=mod(G*H.',2)

%[H, G] = ldpcHGgenerator(n,k);  % Check and encoding matrix
%[H, G] = hammingtonHG();



noise=rand(1, n);
noise=noise<p


message=randi([0 1], 1, k)
enc=ldpcEnc(message,G)
rec=mod(enc+noise,2)

dec=ldpcDec(rec, H, 2)

size(message);
size(dec);

decodedRigth=sum(enc==dec)
receivedRight=sum(enc==rec)