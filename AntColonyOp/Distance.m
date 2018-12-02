function distanceMatrix = Distance(city_grid)
    % citygrid:         grid of each city
    % distanceMatrix:   Euclidean distance matrix
    % return Euclidean distance matrix
    [cityNum,~] = size(city_grid);  % cityNum:  the number of city
    distanceMatrix = zeros(cityNum,cityNum);    
    for icity = 1:cityNum
        for jcity = 1:cityNum
            delta_x = city_grid(icity,1) - city_grid(jcity,1);  
            delta_y = city_grid(icity,2) - city_grid(jcity,2);
            distanceMatrix(icity,jcity) = sqrt(delta_x .^2+delta_y.^2);
            if icity == jcity
                distanceMatrix(icity,jcity) = Inf;
            end
        end
    end
end