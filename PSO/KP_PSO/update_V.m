function update_V()
    global pBest gBest X V popsize dimensions
    global w c1 c2 
    rand1 = rand(popsize,dimensions);   
    rand2 = rand(popsize,dimensions);
    V = w .* V + rand1 .* c1 .* (pBest -X) + rand2 .* c2 .* (repmat(gBest,[popsize,1]) - X);
end