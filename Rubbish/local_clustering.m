








%First we find the adjacency matrix
path = 'C:\Nitin\Study\621\karate.gml';


%This calcualtes the row sum to find the degree
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



%Calculate the local clustering coeffecient

dci = [];
for i=1:length(G)
    for j=1:length(G)
        if rowsum(i) >= 2
            fact = prod(1:rowsum(i));
            k = rowsum(i) - 2;
            fact_den = prod(1:k);
            dci(i) = fact/(2*fact_den);
            
        else
            dci(i) = 0;
        end
    end
end
%dci is the (dc1 2)term in the clustering coeff formula

%finds sigma ajk
sum =0;
numerator = [];
 for i=1:length(G)
     for j=1:length(G)
         for k=1:length(G)
             if j<k
                if G(i,j) == 1
                     if G(i,k) == 1 
                        sum = sum + G(j,k);
                     end
                end     
             end   
         end                
     end
     numerator(i) = sum;
     sum=0;
 end
 
 
 
local_clust = [];
for i=1:length(G)
    local_clust(i) = numerator(i)/dci(i);
end
