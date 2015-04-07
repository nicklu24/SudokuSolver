%% Sudoku Main
clear;close all;clc;
tic

solved = 0;
iteration = 0;

%% Initialize Board

% Enter the known elements of the sudoku array
% sudoku used available at this link (http://www.websudoku.com/?level=2&set_id=5989254854)
inSudoku = [4 0 0 0 0 0 7 0 9 0 0 9 0 0 5 0 0 3 0 8 0 1 9 7 0 0 0 0 0 0 ...
    0 3 0 0 0 6 1 0 0 4 0 9 0 0 2 5 0 0 0 6 0 0 0 0 0 0 0 2 7 3 0 6 0 9 ...
    0 0 6 0 0 8 0 0 2 0 7 0 0 0 0 0 4];



[bitboard, sudoku] = initializeBoard(inSudoku);

%% Main Loop
while (solved == 0)
    %% Search
    bitboard = search(bitboard);
    %% Backtrack
    bitboard = backTracking(bitboard);
    %% Check Solved
    if (sum((bitboard(:,:,10))==81))
        solved = 1;
    end
        
    %% Increment
    iteration = iteration + 1;
    if (iteration == 1e6)
        break
    end
end

%% Print Board

toc