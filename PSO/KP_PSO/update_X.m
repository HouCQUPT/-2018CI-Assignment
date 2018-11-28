function  update_X()
    global V X
    X = V + X;
    X = sigmoid();
    
end