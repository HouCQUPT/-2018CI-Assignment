function lengthroute = greedMethod(distanceMatrix)
% distanceMatrix:       a distance matrix
% routeLength:          the best Route by computing greed method
global citygrid
[cityNum, ~] = size(distanceMatrix);
tabu = zeros(1,cityNum);    % a vector which set 1 had arrived
route = zeros(1,cityNum);   % a vector which ant had arrived
nowCity = randperm(cityNum,1);    % choose a city as started city by randoming number
tabu(1,nowCity) = 1;
route(1,1) = nowCity;
for iant = 2:cityNum
    dis = distanceMatrix(nowCity,:);
    dis(1,find(tabu == 1)) = inf;
    [~,nextcity] = min(dis(1,:));  
    route(1,iant) = nextcity;
    tabu(1,nextcity) = 1;
    nowCity = nextcity;
end
hamitonRoute = [route,route(1,1)];   % constructing a Hamiton route for compurting length
lengthroute = 0;

% plotting figure AND compurting length
plotRout(hamitonRoute);
hold on
plot(citygrid(route(1,1),1),citygrid(route(1,1),2),'ro');
text(citygrid(route(1,1),1),citygrid(route(1,1),2),' Start');title('Greed Mothod');
for i = 2:length(hamitonRoute)
    lengthroute = lengthroute + distanceMatrix(hamitonRoute(1,i-1),hamitonRoute(1,i));
end
end
    
