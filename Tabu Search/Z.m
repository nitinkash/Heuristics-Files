function z = Z(z, swap, sol, iter)
    z(swap(1), sol(swap(1))) = iter;
    z(swap(2), sol(swap(2))) = iter;
end
