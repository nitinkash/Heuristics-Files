function [rowsum, vertex] = greatest(G) %Teseted and OK
rowsum = [];
rower = 0;
for i=1:length(G)
    for j=1:length(G)
        rower = rower + G(i,j);
    end
    rowsum(i) = rower;
    rower = 0;
end        
%End of degree calculations

%Finds the node with highest degree
degree_max = 0;
for i=1:length(rowsum)
    if rowsum(i)>degree_max
        degree_max = rowsum(i);
        vertex = i;
    end
end    

end
