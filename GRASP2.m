function [Best_Tour, Dist] = GRASP2(Tour_Candidates, Dist_Candidates, alpha, D, Max_Iter)
    Dist_sort = sort(Dist_Candidates);
    RCL_Criteria = Dist_Sort(-1) + alpha*(Dist_Sort(1)+Dist_Sort(-1));
    RCL_Tour = zeros(:,n);
    for i = 1:Max_Iter
        if TOUR(D, Tour_Candidates(i,:)) < RCL_Criteria
            RCL_Tour(end+1,:) = Tour_Candidates(i,:);
        end
    end
    
        
    
    
    