function plotRout(Roud_Rout)
    global citygrid
    [~,m]  = size(Roud_Rout);
    figure,
    for i = 2:m
        line([citygrid(Roud_Rout(1,i),1),citygrid(Roud_Rout(1,i-1),1)],[citygrid(Roud_Rout(1,i),2),citygrid(Roud_Rout(1,i-1),2)])
    end
end