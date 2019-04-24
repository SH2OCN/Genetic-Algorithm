function [ newpop ] = Nmutate( oldpop, Pm )
%【Nmutate对旧种群进行变异得到新种群】
%
% 输入：oldpop：旧种群
%       Pm    ：变异概率
%
% 输出：newpop：变异后的新种群

[~,length,num] = size(oldpop);
newpop = oldpop;
for page = 1:num
    p = rand;  %生成随机数
    if p < Pm  %如果满足变异条件
        pos = ceil(length * rand); %随机选一个位置进行变异
        newpop(:,pos,page) = not(oldpop(:,pos,page));   
    end
end
        
end

