function [ newpop ] = Nunimutate( oldpop, Pm )
%��Nunimutate ���ȱ��졿
% ���룺oldpop������Ⱥ
%           Pm���������
% �����newpop������������Ⱥ

mut = rand(size(oldpop)) < Pm;
newpop = abs(mut - oldpop);

end

