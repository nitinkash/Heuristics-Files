function [Tour_Candidates, Dist_Candidates] = GRASP1(D)
    Max_Iter = 20;
    n = size(D,1);
    Tour_Candidates = zeros(Max_Iter,n);
    Dist_Candidates = zeros(Max_Iter, 1);
    for k=1:Max_Iter
        p = zeros(1,n);
        start = randi([1 n],1,Max_Iter);
        start_node = start(k);
        p(1) = start_node;
        Dummy = D;
        for j = 2:n
            D(start_node,:) = inf; %Sets the distance of visited node to infinity
            [~,start_node] = min(D(:,start_node)); 
            p(j) = start_node;    
        end
        Cost = 0;
        D = Dummy;
        for i = 1:n-1
            Cost = Cost + D(p(i),p(i+1));
        end
        for z=1:n
            Tour_Candidates(k,z) = p(z);
        end
        Dist_Candidates(k) = Cost;
        Cost = 0;
    end
    
    Dist_sort = sort(Dist_Candidates);
    RCL_Criteria = Dist_sort(length(1)) + 0.7*(-Dist_sort(1)+Dist_sort(length(Dist_sort)));
    RCL_Tours = Tour_Candidates;
    for i = 1:size(Tour_Candidates)
        if TOUR(D, Tour_Candidates(i,:)) > RCL_Criteria 
            TOUR(D, Tour_Candidates(i,:))
            RCL_Tours(i,:) = Inf;
        else
            continue
        end  
    end
    
    %START OF GRASP procedure
    
    for i = 1:
    
    
    
   
end   
    