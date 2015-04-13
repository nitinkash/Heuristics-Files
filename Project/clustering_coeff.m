function [cc] = clustering_coeff (subgraph) 
cc = [];
degree = [];
deg = 0;
n = size(subgraph,1);

degree = sum(subgraph,1);
dci = [];
for i=1:n
    if degree(i)> 1
        dci(i) = nchoosek(degree(i),2);
    else
        dci(i) = 0;
    end
end
%dci returns the binomial coeffecient of degree choose 2
numerator = zeros(1,n);
%finds sigma sigma ajk
z =0;
 for i=1:n
     for j=1:n
         for k=1:n
             if j<k
                if subgraph(i,j) == 1
                     if subgraph(i,k) == 1
                         z = z + subgraph(j,k);
                     end
                end
             end   
         end                
     end
    numerator(i) = z;
    z = 0;
 end
 
 for i=1:n
    cc(i) = numerator(i)/dci(i);
 end
end