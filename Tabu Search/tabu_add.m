function tabu = tabu_add(old_tabu, element, tabu_size)
    [m,n] = size(old_tabu);
    if m < tabu_size
        tabu = zeros(m+1,n);
        for i=1:m
            tabu(i,:) = old_tabu(i,:);
        end
        tabu(m+1,:) = element;
    else
        tabu = zeros(m,n);
        tabu(2,:) = old_tabu(2,:);
        tabu(1,:) = element;
    end    
end   
    