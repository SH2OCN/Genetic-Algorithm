function [ newX1,newX2 ] = Ncross_sp( oldX1,oldX2 )
%��Ncross_sp����������е���˳�򽻲桿
%   
% ���룺oldX1��oldX2������������
%
% �����newX1��newX2�������Ӵ���

[~,length] = size(oldX1);
k = ceil((length-1) * rand);  %�������1~��lengyh-1�����һ��������Ϊ����λ��
newX1 = [oldX1(:,1:k) oldX2(:,k+1:length)];
newX2 = [oldX2(:,1:k) oldX1(:,k+1:length)];
end

