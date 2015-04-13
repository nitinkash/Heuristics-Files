function [cc] = clusteringcoeff (subgraph,G) %tested and OK
cc = [];
degree = [];
deg = 0;
for i=1:length(subgraph)
    for j=1:length(subgraph)
        deg = deg + G(i,j);
    end
    degree(i) = deg;
    deg = 0;
end  
%Degree(i) returns the degree of vertex i
dci = [];
for i=1:length(subgraph)
    if degree(i)> 1
        dci(i) = nchoosek(degree(i),2);
    else
        dci(i) = 0;
    end
end
%dci returns the binomial coeffecient of degree choose 2
numerator = [];
%finds sigma sigma ajk
sum =0;
 for i=1:length(subgraph)
     for j=1:length(subgraph)
         for k=1:length(subgraph)
             if j<k
                if subgraph(i,j) == 1
                     if subgraph(i,k) == 1
                         sum = sum + subgraph(j,k);
                     end
                end
             end   
         end                
     end
    numerator(i) = sum;
    sum = 0;
 end
 
 for i=1:length(subgraph)
    cc(i) = numerator(i)/dci(i);
 end
end