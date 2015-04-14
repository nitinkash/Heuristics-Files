function [dist, p] = SA_runner(iter)
    D = TSPtest2(); 
    [dist,p] = SA(D,10000, .89, 30);
    %This is an improvement stage which runs the simulated annealing
    %procedure many times to give a better result. This is not required.
    for i = 1:iter
        [nd, p_] = SA(D,10000, .89, 30);
        if nd < dist
            dist = nd;
            p = p_;
        end
    end
end
