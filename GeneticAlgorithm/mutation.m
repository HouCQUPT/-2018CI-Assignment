function out = mutation(chromosomes)
% ---- ±äÒìº¯Êý ----
    global popsize dimensions pm x_min x_max
    matchChro = chromosomes;
    for i = 1:dimensions
        for j = 1:popsize
            k = rand(1);
            if k < pm
                chromosomes(j,i) = x_min + (x_max - x_min) .* rand(1);
            end
        end
    end
    out = chromosomes;
end