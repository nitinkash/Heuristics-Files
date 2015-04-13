function [p, L] = runner_TSP()
    start_node = 1;
    [D, ~] = TSPtest1(); %Change to TSPTest2() to get the output for TSP2test
    p = greedy(start_node,D);
    [p, L] = twoOPT(p,D);
    p
    L
end
