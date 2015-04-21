function [sol, cost] = taburunner()
    [sol, cost] = tabu();
    for i =1:20 %Find the best in 50 iterations
        i
        [sol_, cost_] = tabu;
        if cost_ < cost
            sol = sol_;
            cost = cost_;
            
        end
    end
end

            
    