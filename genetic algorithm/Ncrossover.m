function [ newpop ] = Ncrossover( oldpop,Px )
%【Ncrossover：交叉算子总程序】
%
% 输入：oldpop：旧种群
%       Px    ：交叉概率
%
% 输出：newpop：交叉后的新种群

[~,~,num] = size(oldpop);
newpop = zeros(size(oldpop));
rp = randperm(num)'; %rp为种群所有解的一个随机排列
if rem(num,2)        %解决种群规模是奇数的情况
    newpop(:,:,rp(num))=oldpop(:,:,rp(num)); %从父代种群中继承一个解
end
pairs = [rp(1:2:num-1),rp(2:2:num)]; %配对矩阵,随机两两配对
pairnum = size(pairs,1);             %配对数目

for i = 1:pairnum
    p = rand; %生成随机数
    if p < Px %如果随机数小于交叉概率，则进行交叉操作
        [newpop(:,:,pairs(i,1)),newpop(:,:,pairs(i,2))] = ...
           Ncross_sp(oldpop(:,:,pairs(i,1)),oldpop(:,:,pairs(i,2))); %单点交叉
    else
        newpop(:,:,pairs(i,1)) = oldpop(:,:,pairs(i,1));
        newpop(:,:,pairs(i,2)) = oldpop(:,:,pairs(i,2));
    end
end

end

