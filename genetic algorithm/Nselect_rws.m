function [ selpop ] = Nselect_rws( fitness,selnum,pop)
% 【Nselect_rws:轮盘赌选择】
%
% 输入：fitness：种群适应度列向量
%       selnum： 要选择出selnum个个体
%       pop：原种群
%
% 输出：selpop：选择后的新种群
fitness = fitness - min(fitness);%要求所有适应值均为非负数
[oldnum,~] = size(fitness); %得到原种群规模oldnum
cumfit = cumsum(fitness);      %得到适应度累积值
trials = cumfit(oldnum) .* rand(selnum,1); %生成的selnum个随机数
Mu = cumfit(:,ones(1,selnum));           %每个解对应的上界
Md = [zeros(1,selnum);Mu(1:oldnum-1,:)]; %每个解对应的下界
Mt = trials(:,ones(1,oldnum))';          %随机数变成对应的矩阵形式
[SelPages,~] = find(Mt >= Md & Mt < Mu); %得到选出的解的编号
selpop = pop;
for page = 1:selnum
    selpop(:,:,page) = pop(:,:,SelPages(page));
end
end

