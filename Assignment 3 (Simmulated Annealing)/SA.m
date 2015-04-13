function [dist, p] = SA(D, temp_init, cool_rate, max_iter, m)
    temp = temp_init;
    p = greedy(randi(size(D,1),1,1),D);
    %p = random_tour(D);
    dist = TOUR(D,p);
    for i = 1:max_iter
        [p_,new_dist] = twoOPT(p,D); 
        diff = abs(dist-new_dist);
        if new_dist < dist
            p = p_;
            m = ceil(m*exp(-diff/(i*temp)));
            if m == 0
                m=1;
            end
            temp = temp*cool_rate;
        else
            if rand(1) < exp(-diff/(temp))
                p = p_;
                m = ceil(m*exp(-diff/(i*temp)));
                if m == 0
                    m=1;
                end
            end
        end
    end
       
end
   