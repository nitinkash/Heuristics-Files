function [dist, p] = SA(D, temp_init, cool_rate, max_iter)
    %Initializes the temperature as temp_init which is typically a high
    %value
    temp = temp_init;
    %Starts with a greedy tour, a random tour can be picked instead
    p = greedy(randi(size(D,1),1,1),D);
    dist = TOUR(D,p);
    for i = 1:max_iter
        [p_,new_dist] = twoOPT(p,D); 
        diff = abs(dist-new_dist);
        if new_dist < dist
            p = p_;
            temp = temp*cool_rate;
        else
            if rand(1) < exp(-diff/(temp))
                p = p_;
            end
        end
    end
       
end
   