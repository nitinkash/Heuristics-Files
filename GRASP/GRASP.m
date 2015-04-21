function [Best_Tour, Dist] = GRASP(D, alpha, Max_Iter)
    n = size(D,1);
    Dist = Inf;
    Best_Tour = zeros(1,n);
    for k = 1:Max_Iter
       p = rand_greedy(D, alpha);
       [p_,L] = twoOPT(p, D); 
       if L < Dist
           Dist = L;
           Best_Tour = p_;
       end
    end
    
           
           
           