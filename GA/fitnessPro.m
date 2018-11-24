function  out = fitnessPro(chromosomers)
% ---- fitness proportion model -------
    global popsize
    [~,~,~,fitness] = fitnessFun(chromosomers);
    propor = fitness(1:popsize) ./ sum(fitness);
    wheel = zeros(popsize,1);
    for i = 1:popsize
        flag = 0;
        total = 0;
        r = rand(1);
        for j = 1:popsize
            total = total + propor(j,1);
            if r <= total && flag == 0
                wheel(i,1) = j;
                flag = flag + 1;
            end
        end
    end
    out = chromosomers(wheel(:,1),:);
end