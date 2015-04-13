function subgraph =  cluster_sg_generator(G, cluster) 
    n = size(G,1);
    subgraph = zeros(n,n);
    for i = 1:n
        for j=1:n
            if cluster(i) == 1 && cluster(j) == 1
                subgraph(i,j) = G(i,j);
            else 
                subgraph(i,j) = 0;
            end
        end
    end
end
