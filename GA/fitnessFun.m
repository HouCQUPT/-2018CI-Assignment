function [bestfitness, meanfitness, bestChro,fitness] = fitnessFun(x)
% ----- fitness function £º 23 - y ------------------
    global popsize
    fitness = zeros(popsize,1);
    for i = 1:popsize
    fitness(i,1) = 23 - x(i,1) - x(i,2) .^2 - x(i,3) .* x(i,4) - sin(sum(x(i,1:2))) - 1;
    end
    [bestfitness, index] = max(fitness);
     bestChro = x(index,:);
     meanfitness = mean(fitness);
end