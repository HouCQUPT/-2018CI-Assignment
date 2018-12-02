%% PSO Function Optimization
% ----- author:H
clc,close,clear;

%% Setting Para
% ------- popsize: the size of population
% ------- dimensions: the number of dimension 
% ------- V:       velocity vector
% ------- X:       local vextor
% ------- pBest:   Historical best price
% ------- gBest:   Global best price
% ------- w:       Interia Weight
% ------- c1,c2:   acceleration coefficients
global popsize dimensions V X pBest gBest 
global w c1 c2  X_max X_min
popsize = 50;
dimensions = 4;
pBest = zeros(popsize, dimensions) + 200;
gBest = zeros(popsize, 1) + 200;
X_min = -3;X_max = 3;   % Attention !!
V = 0.1 * (X_min + (X_max - X_min)) .* rand(popsize,dimensions);
X = X_min + (X_max - X_min) .* rand(popsize,dimensions);
w = 0.9;c1 = 2;c2 = 2;

%% Init PSO
pBest = X;
fitness = fitnessFun(X);
[~,index] = min(fitness);      % Attention min()!!  other target , other function
gBest = X(index,:);
iterations = 100;   % ------- iterations:   the number of iteration
plotfitness = zeros(iterations,1);
for iter = 1:iterations
    fitness = fitnessFun(X);
    plotfitness(iter,1) = max(fitness);
    V = update_V();
    X = update_X();
    [pBest,gBest] = pg_Best(fitness);    % Attention!! other target , other function
    w = w - w ./ iter;
end;
figure,plot(1:iterations,plotfitness,'-');
xlabel('Iterations');
ylabel('Fitness');
title('PSO - Function Opitimization');
