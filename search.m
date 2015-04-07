function bitboard = search(bitboard)
% Search function for the SudokuSolver

% Basic Rules for Solving Sudoku
%--------------------------------------------------------------------------
% 1. No other value is allowed according to the allowed values matrix.
% 2. A certain value is allowed in no other square in the same section.
% 3. A certain value is allowed in no other square in the same row or column.
% 4. A certain value is allowed only on one column or row inside a section, 
%    thus we can eliminate this value from that row or column in the other sections.
% 5. Naked Pairs Rule


%% Find the Index of the Locations with the Lowest Number of Possibilities
solved = 0;
while (solved == 0)

% Check Rule 1

% Check Rule 2

% Check Rule 3

% Check Rule 4

% Naked Pairs
   nakedPairCheck = 1;
   
   if (sum(bitboard(:,:,10)) == 81)
       solved = 1;
   end
   
   if (nakedPairCheck == 1)
       break; % If no naked pairs then break so we can backtracking
   end

    
end

