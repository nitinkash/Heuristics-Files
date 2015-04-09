wfunction [graph_new] = add(v, subgraph, adjacency)
graph_new = subgraph;
graph_new(v,:) = adjacency(v,:);
graph_new(:,v) = adjacency(:,v);