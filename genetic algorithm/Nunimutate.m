function [ newpop ] = Nunimutate( oldpop, Pm )
%【Nunimutate 均匀变异】
% 输入：oldpop：旧种群
%           Pm：变异概率
% 输出：newpop：变异后的新种群

mut = rand(size(oldpop)) < Pm;
newpop = abs(mut - oldpop);

end

