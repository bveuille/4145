function [H, Hr , Hrr, G ] = ldpcHtoG( in )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[rowM, colM] = size(in);
n=colM;
k=n-rowM;


H=in;

% To row echelon

currentCol=1;

for row1=1:rowM
    
    % iterate until a 1 is found on the current column
    found=false;
    while not(found)
        
        % security
        if currentCol>colM
            %disp('Securiy used');
            break
        end
        
        
        % find a row with a 1 on the current column and put it on top
        for row2=row1:rowM
            if in(row2, currentCol)==1
               tmp= in(row2,:);
               in(row2,:)=in(row1,:);
               in(row1,:)=tmp;
               found=true;
               break;
            end
        end

        % if found remove all the other 1 underneath
        if found
            for row2=row1+1:rowM
                if in(row2,currentCol)==1
                    in(row2,:)=mod(in(row2,:)+in(row1,:),2);
                end
            end
        
        else
           %fprintf('Not found for col %d\n',currentCol);
           
        end
        currentCol=currentCol+1;
        fprintf('colonne : %d\n row1 : %d\n rqng : %d\n',currentCol, row1, rank(in));
        in
    end
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

Hrr=in;


% Transpose the non-identity part of the matrix

A=Hrr(:,rowM+1:colM);
size(A);

tmp1=H(:,1:k);
tmp2=H(:,k+1:n);
H=[tmp2 tmp1];

G=[eye(k),A.'];




end