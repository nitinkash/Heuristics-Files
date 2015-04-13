function p = greedy(start_node,D)

n = size(D,1);
p = zeros(1,n);
p(1) = start_node;

for k = 2:n
    D(start_node,:) = inf; %Sets the distance of visited node to infinity
    [~,start_node] = min(D(:,start_node)); 
    p(k) = start_node;
end