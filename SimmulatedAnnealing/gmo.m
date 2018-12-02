function out = gmo(x)
%   对越界进行贪心修正
    global Price Weight MaxWeight 
    pricedensity = Price ./ Weight;
        temp = x(1,:);
        [~, full_index] = find(temp == 1);
        full_den = pricedensity(full_index);
        [~, full_sortindex] = sort(full_den);
        old_temp = temp;
        i = 1;
        while(old_temp * Weight > MaxWeight & i <= length(full_sortindex))
            old_temp(full_index(full_sortindex(i))) = 0;
            i = i + 1;
        end
        x(1,:) = old_temp;
        out = x;
end