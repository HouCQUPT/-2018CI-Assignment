function out = kpGoo(x)
%   贪心优化
    global Weight Price popsize MaxWeight
    pricedensity = Price ./ Weight;
    for pop = 1:popsize
        x_sigle = x(pop,:);
        hole_index = find(x_sigle == 0);
        hole_den = pricedensity(hole_index);
        [~, hole_sortindex] = sort(hole_den,'descend'); %   大 -> 小
        temp = x_sigle;
        for i = 1:length(hole_sortindex)
            temp(hole_index(hole_sortindex(i))) = 1;
            if temp * Weight > MaxWeight
                temp(hole_index(hole_sortindex(i))) = 0;
            end
        end
        x(pop,:) = temp;
     end 
    out = x;
end