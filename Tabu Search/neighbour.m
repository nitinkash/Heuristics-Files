function [locations_, swap] = neighbour(locations)
    [~,n] = size(locations);
    a = 0;
    b = 0;
    while a == b
        a = randi([1 n],1);
        b = randi([1 n],1);
    end
    locations_ = locations;
    locations_(b) = locations(a);
    locations_(a) = locations(b);
    swap = [a b];
end
