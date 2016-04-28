






n=16;
nb=0;
countMax=1000;
intMax=power(2,n*n);


k=5;   % Message length
wc=4;
wr=6;

m=k/(wr/wc-1);
n=m+k;


for i=0:countMax
    
    
    
matrix=randi([0 1],m,n); k=n;
%matrix=ldpcCheckMatrix2(16,4,6);

%vector=de2bi(i,n*n);
%matrix=reshape(vector,[n,n]);




if mod(det(matrix(:,1:m)),2)==1
    nb=nb+1;
    [H Hr Hrr G]=ldpcHtoG2(matrix)
    GftimeHT=mod(G*H.',2)
    break
end



end


nb
nb/countMax

