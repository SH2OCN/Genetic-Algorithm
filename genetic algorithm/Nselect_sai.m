function [ selpop ] = Nselect_sai( fitness,selnum,pop)
% 【Nselect_sai:1v1锦标赛选择】
%
% 输入：fitness：种群适应度列向量
%       selnum： 要选择出selnum个个体
%       pop：原种群
%
% 输出：selpop：选择后的新种群
rp1 = randperm(selnum);
rp2 = randperm(selnum);
selpop = pop(:,:,rp1);
pop2 = pop(:,:,rp2);
a = fitness(rp1)<fitness(rp2);
selpop(:,:,a) = pop2(:,:,a);
end

