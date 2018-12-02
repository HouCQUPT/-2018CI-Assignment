function x = method1()
    global X  dimensions
    x = X;
    local_l = randi([1,dimensions-1],1);
    local_r = randi([local_l,dimensions],1);
    x(1,local_l:local_r) = ~x(1,local_l:local_r);
    x = gmo(x); % Ì°ÐÄÐÞÕý
end