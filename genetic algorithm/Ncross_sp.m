function [ newX1,newX2 ] = Ncross_sp( oldX1,oldX2 )
%【Ncross_sp对两个解进行单点顺序交叉】
%   
% 输入：oldX1，oldX2：两个父代解
%
% 输出：newX1，newX2：两个子代解

[~,length] = size(oldX1);
k = ceil((length-1) * rand);  %随机生成1~（lengyh-1）间的一个整数作为交叉位置
newX1 = [oldX1(:,1:k) oldX2(:,k+1:length)];
newX2 = [oldX2(:,1:k) oldX1(:,k+1:length)];
end

