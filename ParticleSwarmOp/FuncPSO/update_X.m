function out = update_X()
    global V X
    out = V + X;
    out(out > 3) = 3;  %Attention !!
    out(out < -3) = -3;
end