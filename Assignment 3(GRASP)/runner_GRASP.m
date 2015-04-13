function [p, L] = runner_GRASP()
    [D, ~] = TSPtest1(); %Change to TSPTest2() to get the output for TSP2test
    alpha = 0.25; %Define the value of the random seed (alpha) here
    Max_Iter = 100;
    [Best_Tour, Dist] = GRASP(D, alpha, Max_Iter);
    a = 'The Best Tour obtained is'
    Best_Tour
    a = 'The value of the tour is'
    Dist
end
