function out = sigmoid()
global X popsize dimensions
    X = 1./ (1+ exp(-X));
    match = rand(popsize,dimensions);
    match = match - X; % < 0 set 1
    match(match < 0) = 1;
    match(match ~= 1 ) = 0;
    out = match;
end