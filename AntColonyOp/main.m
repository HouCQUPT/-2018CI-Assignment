%% Basic-Ant Colony Opitimization
% To solve TSP(Traveling Salesman Problem)
% Standard TSP DataSet ch130:     the best route length is 6110
% Standard TSP DataSet chn31:     the best route length is 15377
% Standard TSP DataSet berlin52:  the best route length is 7542
clc;close ;clear;
global citygrid
citygrid = load('chn31.txt');  % Loading city frid
citygrid = citygrid(:,2:3);

%% Step 1 : Structuring Adjacency Matrix
distanceMatrix = Distance(citygrid);

%% Step 2 : Initialize Parameter
lengthRoute = greedMethod(distanceMatrix);  % length which is compurted by greed method
iterations = 300;   % the number of iteration
[cityNum,~] = size(citygrid);
antNum = cityNum;   % the number of ant, Normally, antNum == cityNum
Tau = zeros(cityNum,cityNum) + antNum /lengthRoute; % Initializing Tau
Eta = distanceMatrix.^-1;       % heuristic information
bestLength = Inf;               % Initializing the best route length
plotLength = zeros(iterations,1);

%% run
for iter = 1:iterations
    rout = zeros(antNum,cityNum);  % Initialzing started city each ant
    rout(:,1) = randperm(cityNum,antNum)'; 
        for ant = 1:antNum
            tabu = zeros(1,cityNum);   
            nowcity = rout(ant,1);      % started city each ant
                for city = 2:cityNum
                    tabu(1,nowcity) = 1;
                    targetcity = find(tabu == 0);   
                    nextcity = RWS(Tau,Eta,nowcity,targetcity); % random proportional
                    nowcity = nextcity;
                    rout(ant,city) = nextcity;  
                end
        end

    %% updating Tau
    hamitonroute = [rout,rout(:,1)];   % Hamiton Route
    Phu = 0.4;  
    Tau = (1 - Phu) .* Tau;
    ant_RoutLength = zeros(antNum,1);

    for ant = 1:antNum
        total_l = 0;
        ant_R = hamitonroute(ant,:);
        for city = 2:cityNum+1
            total_l = total_l + distanceMatrix(ant_R(city-1),ant_R(city));
        end
        ant_RoutLength(ant,1) = total_l;    
    end

    % get data
    plotLength(iter,1) =  min(ant_RoutLength);
        if min(ant_RoutLength) < bestLength
            [bestLength,index_ant] = min(ant_RoutLength);
            Best_R = hamitonroute(index_ant,:);
            plotLength(iter,1) =  bestLength;
        end
    plotLength(iter,1) =  bestLength;
    Tau = (1 - Phu) .* Tau;
    for ant = 1:antNum
        ant_R = hamitonroute(ant,:);
        for city = 1:cityNum
                Tau(ant_R(1,city),ant_R(1,city+1)) = Tau(ant_R(1,city),ant_R(1,city+1)) + 1 ./ ant_RoutLength(ant,1);
        end  
     end
end
plotRout(Best_R);hold on
title('Basic-Ant Colony Opilization');
figure,
plot(1:iterations,plotLength,'-')
title('Basic-Ant Colony Opilization');
xlabel('iterations');
ylabel('Route Length each iter');
