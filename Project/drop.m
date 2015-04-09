function [graph_new] = drop(vlow, subgraph)
graph_new = subgraph;
graph_new(vlow,:) = 0;
graph_new(:,vlow) = 0;






