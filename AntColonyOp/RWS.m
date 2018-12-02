function nextcity = RWS(Tau,Eta,nowcity,targetcity)
    % random proportional
    alpha = 1;Bta = 4;  % setting parameter
    sigma = sum(Tau(nowcity,targetcity).^alpha .* Eta(nowcity,targetcity).^Bta);
    Pro_city = Tau(nowcity,targetcity).^alpha .* Eta(nowcity,targetcity).^Bta ./ sigma;
    k = rand(1);
    total = 0;
    j = 0;
    while(k>total)
        j = j+1;
        total = total + Pro_city(1,j);
    end
    nextcity = targetcity(j);
end