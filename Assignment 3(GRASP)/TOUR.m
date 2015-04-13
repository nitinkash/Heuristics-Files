function [Cost] = TOUR(D, p)
    Cost = 0;
    n = size(D,1); 
    for i = 1:n-1
        Cost = Cost + D(p(i),p(i+1));
    end
end
