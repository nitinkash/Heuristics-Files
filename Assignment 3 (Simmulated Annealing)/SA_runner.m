function [dist, p] = SA_runner(iter)
    D = TSPtest1(); 
    [dist,p] = SA(D,10000, .89, 300, 0);
    for i = 1:iter
        [nd, p_] = SA(D,10000, .89, 300, 0);
        if nd < dist
            dist = nd;
            p = p_;
        end
    end
end
