function D = Distance(X)
[m,n] = size(X);
D = zeros(m);
for j = 1:m
    for k = 1:n
        a = X(:,k) - X(j,k);
        D(:,j) = D(:,j) + a.*a;
    end
end
D = sqrt(D);