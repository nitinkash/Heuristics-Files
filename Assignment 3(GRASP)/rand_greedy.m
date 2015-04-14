function p = rand_greedy(D, alpha)
n = size(D,1);
p = zeros(1,n);
start_node = randi([1 n],1); %Pick a random start point for Diversification 
p(1) = start_node; 

for k = 2:n
    D(start_node,:) = inf; %Sets the distance of visited node to infinity
    criteria = min(D(:,start_node)) + alpha*(max(D(:,start_node)) - min(D(:,start_node)));
    RCL = [];
    for i = 1:n
        if D(i,start_node) < criteria
            RCL(end+1) = i;
        end
    end
    [~, b] = size(RCL);
    if b == 2 || b == 1
        start_node = min(RCL);
    else
        start_node = randsample(RCL,1);
    end    
          
    p(k) = start_node;
end
end