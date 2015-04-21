%RUN THIS!!!!!!!!!!!!!!!
function [sol,cost] = tabu()  
%This instance of this problem is taken from http://www.opt.math.tu-graz.ac.at/qaplib/data.d/esc16a.dat

    a = [ 0    90    10    23    43     0     0     0     0     0    0     0;
             90     0     0     0     0    88     0     0     0     0    0     0;
             10     0     0     0     0     0    26    16     0     0    0     0;
             23     0     0     0     0     0     0     0     0     0    0     0;
             43     0     0     0     0     0     0     0     0     0    0     0;
              0    88     0     0     0     0     0     0     1     0    0     0;
              0     0    26     0     0     0     0     0     0     0    0     0;
              0     0    16     0     0     0     0     0     0    96    0     0;
              0     0     0     0     0     1     0     0     0     0   29     0;
              0     0     0     0     0     0     0    96     0     0    0    37;
              0     0     0     0     0     0     0     0    29     0    0     0;
              0     0     0     0     0     0     0     0     0    37    0     0]; %Gives a values

    b = [ 0    36    54    26    59    72     9    34    79    17   46    95;
            36     0    73    35    90    58    30    78    35    44   79    36;
            54    73     0    21    10    97    58    66    69    61   54    63;
            26    35    21     0    93    12    46    40    37    48   68    85;
            59    90    10    93     0    64     5    29    76    16    5    76;
            72    58    97    12    64     0    96    55    38    54    0    34;
             9    30    58    46     5    96     0    83    35    11   56    37;
            34    78    66    40    29    55    83     0    44    12   15    80;
            79    35    69    37    76    38    35    44     0    64   39    33;
            17    44    61    48    16    54    11    12    64     0   70    86;
            46    79    54    68     5     0    56    15    39    70    0    18;
            95    36    63    85    76    34    37    80    33    86   18     0]; %Gives the B values

    n = size(b,1);
    cost = inf;
    counter = 0;
    while cost > 15000 || counter < 100
        sol = randperm(n); %Start with a random soln 
        cost = cost_compute(sol, b, a);
        counter = counter +1;
    end
    [tabu_size,~] = size(b); %Using the recommended tabu size from the book
    tabu = zeros(tabu_size, n);
    z_matrix = zeros(n,n);
    cost_ = inf;
    while cost_>cost
        [sol_, swap] = neighbour(sol);
        cost_ = cost_compute(sol_,b,a);
        iteration_number = 1;
        z_matrix = Z(z_matrix, swap, sol_, iteration_number);
    end
    sol = sol_;
    cost = cost_;
    
    iteration_number = 2;
    check_fail_counter = 0;
    %Set the cost of the resulting solution to be at most 10000. It will 
    %take the solution when 1000 neighbours have been checked and the 
    %aspiration criteria is not met.
    while cost_compute(sol_,b,a) > 10000 && check_fail_counter <1000 
        [sol_, swap_] = neighbour(sol);
        if aspiration_check(sol, sol_, b,a, z_matrix, swap_, iteration_number) 
            z_matrix = Z(z_matrix,swap_, sol_, iteration_number);
            iteration_number = iteration_number + 1;
            sol = sol_;
            check_fail_counter = 0;
            %delta(end+1) = delta(end) + 
        else
           check_fail_counter = check_fail_counter +1;
        end   
    end
    end
    
    
    
    
        
        
        
        
    
    
   
    
    
    




    