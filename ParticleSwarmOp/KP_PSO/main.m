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
X = kpGmo(X);   % ̰������
X = kpGoo(X);   % ̰���Ż�
iterations = 50;
plotfitness = zeros(iterations,1);
for iter = 1:iterations
    value = X * Price;  % ��Ӧֵ
    
    pBest_fit = pBest * Price;
    index = find(value > pBest_fit);    % ����pBest������
    pBest(index,:) = X(index,:);
    [~,index] = max(value);
    bestfitness = X(index,:) * Price;
    
    if bestfitness > gBest * Price      % ����gBest
        gBest = X(index,:);
    end
    plotfitness(iter,1) = gBest * Price;
    
    %   �����ٶ� �� �����ռ�
    update_V();
    update_X();
    
    X = kpGmo(X);
    X = kpGoo(X);
    
    %   ���¹���
    w = w - w./iter;
end
figure,plot(1:iter,plotfitness);
title('0��1��������  GOPSO');
xlabel('Iteration');
ylabel('gBest-Fitness');
display(['���Ų���:' num2str(gBest)]);
display(['����ֵ:' num2str(plotfitness(iter))]);


