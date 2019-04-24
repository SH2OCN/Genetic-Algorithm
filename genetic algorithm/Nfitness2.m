function [ fitness ] = Nfitness2( pop,length )
% 【Nfitness2：用于计算种群中所有解对应的坐标及Rosenbrock目标函数值】
% 注意：可能有负数
% 输入：pop：种群（2 * length * num 矩阵）
% 
% 输出：fitness：适应度矩阵[x y z](num * 3)

xmin = -2;  xmax = 2;  %自变量x取值范围
ymin = -1;  ymax = 3;  %自变量y取值范围
num = size(pop,3);
fitness = zeros(num,3);
for page = 1:num
    fitness(page,1) = bin2dec(num2str(pop(1,:,page))); %x二进制转为十进制
    fitness(page,2) = bin2dec(num2str(pop(2,:,page))); %y二进制转为十进制
end
fitness(:,1) = xmin + fitness(:,1) * (xmax - xmin)/(2^(length)-1); %对应到解空间
fitness(:,2) = ymin + fitness(:,2) * (ymax - ymin)/(2^(length)-1); %对应到解空间
X = fitness(:,1);
Y = fitness(:,2);
fitness(:,3) = (1-X).^2 + 100*(Y - X.^2).^2; %计算所有个体的函数适应值
end

