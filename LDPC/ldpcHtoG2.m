function [H, Hr , Hrr, G ] = ldpcHtoG2( in )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[rowM, colM] = size(in);
n=colM;
k=n-rowM;

H=in;

% To row echelon

for diag1=1:rowM       
        
        % find a row with a 1 on the current column diag1 and put it on the
        % diagonal
        
        found=false;
        
        for row2=diag1:rowM
            if in(row2, diag1)==1
               tmp= in(row2,:);
               in(row2,:)=in(diag1,:);
               in(diag1,:)=tmp;
               found=true;
               break;
            end
        end

        % if found remove all the other 1 underneath
        if found
            for row2=diag1+1:rowM
                if in(row2,diag1)==1
                    in(row2,:)=mod(in(row2,:)+in(diag1,:),2);
                end
            end
            
        % if no 1 found abort the transformation
        else
           fprintf('Not found for col %d\n',diag1);
           G=-1;
           return;
        end
        
        fprintf('diag1 : %d\n rang : %d\n determinant mod 2 :%d\n',diag1, rank(in(:,1:rowM)), det(in(:,1:rowM)));
        in
end

Hr=in;

% To reduced row echelon

for row1=1:rowM
    % Remove the 1s above the diagonal on the row1 column
    for row2=1:row1-1
        if in(row2, row1)==1
            in(row2,:)=mod(in(row2,:)+in(row1,:),2);
        end
    end
end

Hrr=in;


% Transpose the non-identity part of the matrix

A=Hrr(:,rowM+1:colM);
size(A);

tmp1=H(:,1:k);
tmp2=H(:,k+1:n);
H=[tmp2 tmp1];

G=[eye(k),A.'];




end