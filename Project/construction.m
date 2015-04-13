function alpha_clusters = construction(alpha)
    D = adjacency();
    MC = maximalCliques(D);
    [n, numCliques] = size(MC);
    k = [];
    alpha_clusters = [];
    for i = 1:numCliques
        for j = 1:n
            if MC(j,i) == 1
                clique = MC(:,i); %picks the clique vector
                k(end+1) = j;
                v = find_neighbours(D,j);
                [t,~] = size(v);
                for s = 1:t
                    if v(s) == 1 && clique(s,1) == 0
                        clique(s,1) = 1; %Include the neighbour in the clique
                        cluster_candidate = clique';
                        sg = cluster_sg_generator(D, cluster_candidate);
                        ccs = clustering_coeff(sg);
                        tag = 0;
                        for t = 1:n
                            if cluster_candidate(t) == 1 && ccs(1,t) >= alpha;
                                tag = tag+1;
                            end    
                        end
                        if tag == sum(cluster_candidate)
                            alpha_clusters(:,end+1) = cluster_candidate';
                        end
                        
                    end
                    clique = MC(:,i);
                end        
                
            end
        end
    end
    alpha_clusters = unique(alpha_clusters','rows')';
 end
 