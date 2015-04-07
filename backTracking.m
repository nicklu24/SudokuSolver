function bitboard = backTracking(bitboard)

 if any(bitboard(:,:,10) > 1) 
    a = bitboard(:,:,10); 
    disp(a)
    [temp,index] = min(a,[],2);
    disp(temp)
    disp(index)
    candidates = getCandidates(bitboard,index);
    for i = 1:length(candidates)            % Iterate over candidates. 

       bitboard(:,:,i) = candidates(i);     % Insert a tentative value. 
       bitboard = backTracking(bitboard);   % Recursive call. 
       if all(bitboard(:,:,10) == 1)        % Found a solution. 
          return 
       end %end if
     end % end for loop
 end  %end if


end % end function

% uses for loops. Vectorized version possible?
function candidates = getCandidates(bitboard,index)
    
temp = zeros(1,9);

for i = 1:9
   if (bitboard(index(1),index(2),i) == 1)
       temp(i) = 1;
   end
   
end % end for loop

candidates = find(temp==1);
end % end function