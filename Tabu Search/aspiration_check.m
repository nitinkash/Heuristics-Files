%swap contains the i, j values
%k is the iteration number
%sol_ is the new solution, a row vector
%sol is the old solution, a row vector
%D is the distance matrix
%flows is the flows matrix
%Z(i,p) give sthe iteration when facility i was in location p
function asp = aspiration_check(sol, sol_, D, flows, Z, swap, k)                 
    [~,n] = size(sol);
    A = 5*n^2; %THIS A MUST BE THE SAME IN ALL FUNCS!!!!!!!!!!!!!
    asp = true;
    if cost_compute(sol_, D, flows) > cost_compute(sol, D, flows)
        asp = false;
    end
    if  Z(swap(1), sol(swap(2)))+A <= k && Z(swap(2), sol(swap(1)))+ A <= k
        asp = false;
    end
    
end
