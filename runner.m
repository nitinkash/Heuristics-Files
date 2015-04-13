path = 'C:\Nitin\Study\621\karate.gml';
alpha = 0.9;
G = adjacency (path);
[rowsum, vertex] = greatest(G);
rowsum_sort = sort(rowsum);
subgraph = subgraph_generator(G, vertex);

for i=1:length(rowsum)
    cc = clusteringcoeff(subgraph, G);
    for j =1:length(cc)
        if cc(j) > alpha
            'High Clustering Coeff Found'
            cc
            break
        else
            continue
        end
        
    end
end    


