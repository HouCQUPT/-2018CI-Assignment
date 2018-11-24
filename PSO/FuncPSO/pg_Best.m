function [pBest_out, gBest_out] = pg_Best(old_fitness)
    global X pBest
    new_fitness = fitnessFun(X);
    match = new_fitness > old_fitness;  % ��������������ı䣬��Ҫ�ı����
    pBest(match == 0,:) = X(match == 0,:);
    fitness = fitnessFun(pBest);
    [~,index] = min(fitness);      % Attention min()!!  other target , other function
    gBest_out = X(index,:);
    pBest_out = pBest;
end