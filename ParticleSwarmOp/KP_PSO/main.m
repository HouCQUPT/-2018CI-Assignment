%% PSO Knaspack Problem
% ----- author:H
clc,close,clear;
data = load('ex1.txt');
%% Setting Para
% ------- popsize: the size of population
% ------- dimensions: the number of dimension 
% ------- V:       velocity vector
% ------- X:       local vextor
% ------- pBest:   Historical best price
% ------- gBest:   Global best price
% ------- w:       Interia Weight
% ------- c1,c2:   acceleration coefficients
% ------- MaxWeight: the max Knapsack Weight 
global popsize dimensions V X pBest gBest 
global w c1 c2 Weight Price MaxWeight
Weight = data(:,1);
Price = data(:,2);
popsize = 100;
dimensions = size(data,1);
pBest = zeros(popsize, dimensions);
gBest = zeros(1,dimensions);
V = rand(popsize,dimensions);
X = randi([0,1],popsize,dimensions);
w = 0.8;c1 = 2;c2 = 2;
MaxWeight = 1000;


%% Init PSO
X = kpGmo(X);   % 贪心修正
X = kpGoo(X);   % 贪心优化
iterations = 50;
plotfitness = zeros(iterations,1);
for iter = 1:iterations
    value = X * Price;  % 适应值
    
    pBest_fit = pBest * Price;
    index = find(value > pBest_fit);    % 大于pBest的索引
    pBest(index,:) = X(index,:);
    [~,index] = max(value);
    bestfitness = X(index,:) * Price;
    
    if bestfitness > gBest * Price      % 更新gBest
        gBest = X(index,:);
    end
    plotfitness(iter,1) = gBest * Price;
    
    %   更新速度 和 搜索空间
    update_V();
    update_X();
    
    X = kpGmo(X);
    X = kpGoo(X);
    
    %   更新惯性
    w = w - w./iter;
end
figure,plot(1:iter,plotfitness);
title('0—1背包问题  GOPSO');
xlabel('Iteration');
ylabel('gBest-Fitness');
display(['最优策略:' num2str(gBest)]);
display(['最优值:' num2str(plotfitness(iter))]);


