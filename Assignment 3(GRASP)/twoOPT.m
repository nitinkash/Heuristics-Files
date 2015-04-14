function [p,L] = twoOPT(p,D)
    n = numel(p);
    zstar = -1;
    % Iterate until the tour is 2-optimal
    while zstar < 0
        zstar = 0;
        i = 0;
        b = p(n);
        % Loop over all edge pairs (ab,cd)
        while i < n-2
            a = b;
            i = i+1;
            b = p(i);
            j = i+1;
            d = p(j);
            while j < n
                c = d;
                j = j+1;
                d = p(j);
                % Tour length diff z
                % Note: a == d will occur and give z = 0
                z = (D(a,c) + D(b,d)) - (D(a,b) + D(c,d)); %will be -ve z for improvement

                if z < zstar
                    zstar = z;
                    istar = i;
                    jstar = j;
                end
            end
        end
        % Apply exchange
        if zstar < 0
            p(istar:jstar-1) = p(jstar-1:-1:istar);
        end
    end
    % Tour length
    L = 0; 
    for i=1:length(p)-1
        L = L + D(p(i),p(i+1));
    end    
end    
    