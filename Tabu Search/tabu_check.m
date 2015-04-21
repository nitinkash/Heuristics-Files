function logical = tabu_check(Z, swap, k, tabu_size, sol)
    logical = false;
    if  Z(swap(1), sol(swap(2))) + tabu_size >= k && Z(swap(2),sol(swap(1)))+ tabu_size >= k
        logical = true;
    end
end

% This is the Old code below:
%[m,~] = size(tabu);
    %logical = false;
    %for i=1:m
     %   if element == tabu(i,:)
      %      logical = true;
       %     break
        %end
    %end
%end
      
    