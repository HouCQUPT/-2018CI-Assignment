function out = crossover(chromosomes)
% ------ �����ֽ��� -------
global pc popsize dimensions
chromosome_rate = rand(popsize,1);
chromosome_rate = chromosome_rate < pc;
index_cro = zeros(sum(chromosome_rate),1);  % �ɽ�������
j = 1;
for i = 1:popsize
    if chromosome_rate(i,1) ==1 
        index_cro(j,1) = i;
        j = j+1;
    end
end

index_rand = randperm(length(index_cro));  % �������
index_rand = index_rand';

pertner = floor(sum(chromosome_rate) ./ 2);  % ������Զ���
nonCro = zeros(popsize - 2 * pertner, dimensions);
spouse = zeros(2*pertner, dimensions);
j = 1;
k = 1;
for i = 1:2*pertner
    spouse(j,:) = chromosomes(index_rand(k,1),:); % ���뽻���Ⱦɫ��
    j = j+1;
    k = k+1;
end

% --------- ��ȡû�в��뽻���Ⱦɫ�� --------------
testspouse = spouse;
tempChromosome = chromosomes;
[m,~] = size(spouse);
for i = 1:popsize
    for j = 1:m
        if tempChromosome(i,:) == testspouse(j,:)
            testspouse(j,:) = 0;
            tempChromosome(i,:) = 0;
        end
    end
end
j = 1;
for i =1:popsize
    if tempChromosome(i,1) ~= 0
        nonCro(j,:) = tempChromosome(i,:);
        j = j+ 1;
    end
end

% -------- ��λ���� ----------
j = 1;
oldspouse = spouse;
for i  = 1:pertner
    croLocal = randi([0,dimensions-2]);
    for local = croLocal+2:dimensions
        temp = spouse(j,local);
        spouse(j,local) = spouse(j+1,local);
        spouse(j+1,local) = temp;
    end
    j = j+2;
end
out = [spouse;nonCro];
end