function fitness = fitnessFun(X)
    fitness = X(:,1) + X(:,2) .^2 + X(:,3) .* X(:,4) + sin(sum(X(:,1:2),2)) + 1;
end