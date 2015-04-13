function p_ = swapper(p,m) 
    p_ = p;
    [~,k] = size(p_);
    for i=1:m
        p_1 = randi(k,1,1);
        p_2 = randi(k,1,1);
        dummy = p_(:,p_1);
        p_(:,p_1) = p_(:,p_2);
        p_(:,p_2) = dummy;
    end   
end       
    