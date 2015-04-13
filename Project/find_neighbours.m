function neighbours = find_neighbours(D,i)
    n = size(D,1);
    neighbours = zeros(n,1);
    for k = 1:n
        if D(i,k) == 1
            neighbours(k,1) = 1; %returns a column vector of neighbours
        end
    end
 end

    
