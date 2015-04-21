function cost = cost_compute(sol, D, flows)
    cost = 0;
    n = size(D,1);
    for i = 1:n
        for j = 1:n
        %This computation assumes that the locations are in an array that
        %contains elements from 1 to n
        cost = cost + D(sol(i),sol(j))*flows(i,j);
        end
    end
end


    