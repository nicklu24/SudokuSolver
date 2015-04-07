function [bitboard, sudoku] = initializeBoard(inSudoku)
% Initialize
sudoku = zeros (9,9);
possible = ones(9, 9, 10, 'uint8' );
possum = zeros(9,9);
iRange=[0 0];
jRange=[0 0];

% We know everything 9th entry is a new row, so floor(entry#/9)=row.  Also
% the column position is roughly entry# mod 9 (the column case is special
% case)
for m  = 1:81
    i = ceil(m/9);
    j = mod(m,9);
    if (j==0) 
        j=9;
    end % end if        
    sudoku(i,j)=inSudoku(m);
end % end m loop


disp(sudoku)    


for i=1:9
    for j= 1:9
        if (sudoku(i,j))
            % Determine iRange for the 3x3 box
            switch i
                case {1,2,3}
                    iRange = [1 3];
                case {4,5,6}
                    iRange = [4 6];
                case {7,8,9}
                    iRange = [7 9];
            end
            % Determine jRange for the 3x3 box
            switch j
                case {1,2,3}
                    jRange = [1 3];
                case {4,5,6}
                    jRange = [4 6];
                case {7,8,9}
                    jRange = [7 9];
            end % End j loop
            possible(i,j,:) = 0;                        % zero out the z column for this spot
            possible(i,:,(sudoku(i,j))) = 0;            % zero out the j column for bitboard z
            possible(:,j,(sudoku(i,j))) = 0;            % zero out the i row for bitboard z
            possible(iRange(1) : iRange(2), jRange(1) : jRange(2), sudoku(i,j)) = 0;        % zero out the box
            possible(i,j,(sudoku(i,j))) = 1;            % Put the the 1 where it belongs
            
        end % End if
    end % End j loop
end % End i loop

% Sums the z columns 
for i=1:9 
    for j=1:9;
        possum(i,j) = sum(possible(i,j,:));
    end % End j loop
end % End i loop
possible(:,:,10) = possum;
bitboard = possible;
end

