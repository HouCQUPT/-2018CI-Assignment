%% Simulated Annealing ģ���˻�
% ---- Knaspack Problem 
% ---- author :H
clc;close all;clear all;
data = load('ex1.txt');

%% Init Para
global Weight Price X dimensions MaxWeight
Weight = data(:,1);
Price = data(:,2);
dimensions = size(Weight,1);
MaxWeight = 1000;
X = randi([0,1],1,dimensions);
X = gmo(X);      %̰������


%% Running
T = 20000;
iteration = 500;
time = 0;
plotvalue  = zeros(iteration,1);
while(T)
    time = time + 1;
    %% �ڲ�ѭ��
    for i = 1:10
        % ---- ���������
        new_x = method1();      % ĳһλ����任
        if new_x*Price > X * Price
            X = new_x;
            value = X * Price;
        else 
            Pro = exp((new_x*Price - X*Price) ./ T);
            if rand(1) <= Pro
                X = new_x;
                value = X * Price;
            end
        end
    end
    plotvalue(time,1) = value;
    T = T ./ (1+time);
    if(time == iteration)
        break;
    end
end
plot(1:time,plotvalue(1:time,1),'-');
    

