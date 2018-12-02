%% Genetic Algorithm
% ----- author:HW ------
clc;close all;clear all;

%% Init GA
% ---- popsize:the size of population
% ---- dimensions: function dimension 
% ---- iterations: the number of iteration
% ---- pc:         crossover probability
% ---- pm:         mutation probability
% ---- [x_min,x_max]: the function in the interval [x_min, x_max]
global popsize dimensions iterations pc pm x_min x_max
popsize = 100;
dimensions = 4;
iterations = 500;
pc = 0.88;
pm = 0.1;
x_min = -3;
x_max = 3;
chromosomers = x_min + (x_max - x_min) * rand(popsize, dimensions);
%% Running GA
historyValue = 0;       % set a non negative number as historical best fitness
historyChro = zeros(popsize, dimensions);      % set a zone matrix as best chromosomes memory  
%plotvalue = zeros(popsize,1);
%plotbestvalue = zeros(popsize,1);
%plotmeanvalue = zeros(popsize,1);
for iter  = 1:iterations
    new_chromosomers = fitnessPro(chromosomers); % fitness Proportional Model
    new_chromosomers = crossover(new_chromosomers);
    new_chromosomers = mutation(new_chromosomers);
    [bestfitness, meanfitness, bestChro,~] = fitnessFun(new_chromosomers);
    
    plotvalue(iter,1) = bestfitness;
    plotmeanvalue(iter,1) = meanfitness;
    
    if bestfitness > historyValue
        historyValue = bestfitness;
        historyChro = bestChro;
        k = 1;
        flag = 0;
    else
        k = k+1;
    end
    
    plotbestvalue(iter,1) = historyValue;
    
     if k > iterations / 4
         flag = 1;
     else if k > iterations / 5
             break;
         end
     end
     
     % update chromosomers
     chromosomers = new_chromosomers;
end
  
%% Plot
plot(1:iter,23 - plotvalue,'LineWidth',1);
hold on 
plot(1:iter, 23 - plotmeanvalue,'LineWidth',1);
plot(1:iter, 23 - plotbestvalue,'LineWidth',1);
xlabel('Iteration');
ylabel('Value');
title('函数最值问题');
legend('当代群体最优值', '当代群体平均值', '历史最优值');

    