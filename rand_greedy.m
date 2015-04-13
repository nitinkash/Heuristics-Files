function p = rand_greedy(D, alpha)

n = size(D,1);
p = zeros(1,n);
p(1) = randi([1 n],1); %Pick a random start point for Diversification

for k = 2:n
    D(start_node,:) = inf; %Sets the distance of visited node to infinity
    criteria = min(D(:,start_node)) + alpha*(max(D(:,start_node)) - min(D(:,start_node)));
    for i = 1:n
        if D(i,start_node)< criteria
            x(end+a) = i;
        else
            continue
        end
    end    
    start_node = x(rand([1 size(x)],1]        
    p(k) = start_node;
end