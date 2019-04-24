function [ inipop ] = Ninipop( length,num )
% Ninipop生成随机初始种群;;
%
% 输入： length:编码长度
%        num:初始种群中个体的个数
%
% 输出： inipop:初始种群 (2 * length * num)

inipop = round(rand(2,length,num));


