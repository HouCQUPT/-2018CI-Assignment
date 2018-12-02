function out = kpGmo(x)
%   对越界背包进行贪心修正
    global Price Weight popsize MaxWeight
    pricedensity = Price ./ Weight;
    for pop = 1:popsize
        temp = x(pop,:);
        [~, full_index] = find(temp == 1);
        full_den = pricedensity(full_index);
        [~, full_sortindex] = sort(full_den);
        old_temp = temp;
        i = 1;
        while(old_temp * Weight > MaxWeight && i <= length(full_sortindex)  )
            old_temp(full_index(full_sortindex(i))) = 0;
            i = i + 1;
        end
        x(pop,:) = old_temp;
    end
    out = x;
end