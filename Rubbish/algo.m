[m,n] = size(G);
counter = 0;
rowsum =[];
for i=1:n
     rowsum(i) = sum(G,i); 
end

