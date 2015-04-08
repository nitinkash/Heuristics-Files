function [subgraph, subgraph_nodes] =  subgraph_generator(G, vertex) %TESTED and OK
    subgraph_nodes = [];
    subgraph_nodes(end+1) = vertex;
    for i=1:length(G)
        if G(vertex,i) == 1
            subgraph_nodes(end+1) = i;
        end
    end
    %set of nodes in subgraph is now in matrix subgraph_nodes
    subgraph = [];
    for i=1:length(subgraph_nodes)
        for j=1:length(subgraph_nodes)
            if G(subgraph_nodes(i), subgraph_nodes(j)) == 1
                subgraph(subgraph_nodes(i), subgraph_nodes(j)) = 1; %if there is an edge connecting 
                                                                    %the nodes in the graph then 
                                                                    %the subgraph will also have the edges 
            else
                subgraph(subgraph_nodes(i), subgraph_nodes(j)) = 0;
            end
        end
    end
 end