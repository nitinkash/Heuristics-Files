function sol = solution_gen(solution) %CREATED A DUPLICATE FN BY MISTAKE DELETE THIS!!!!
    [siz,nodes] = size(solution);
    if siz ~= 2
        error('Check the solution')
    end
    swap1 = 1;
    swap2 = 1;
    while swap1 == swap2
        swap1 = randi([1 nodes],1);
        swap2 = randi([1 nodes],1);
    end
    array = solution(2,:);
    dummy = array(1,swap1);
    array(1,swap1) = array(1,swap2);
    array(1,swap2) = dummy;
    sol(1,:) = solution(1,:);
    sol(2,:) = array;
end
