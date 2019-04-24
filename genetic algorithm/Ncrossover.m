function [ newpop ] = Ncrossover( oldpop,Px )
%��Ncrossover�����������ܳ���
%
% ���룺oldpop������Ⱥ
%       Px    ���������
%
% �����newpop������������Ⱥ

[~,~,num] = size(oldpop);
newpop = zeros(size(oldpop));
rp = randperm(num)'; %rpΪ��Ⱥ���н��һ���������
if rem(num,2)        %�����Ⱥ��ģ�����������
    newpop(:,:,rp(num))=oldpop(:,:,rp(num)); %�Ӹ�����Ⱥ�м̳�һ����
end
pairs = [rp(1:2:num-1),rp(2:2:num)]; %��Ծ���,����������
pairnum = size(pairs,1);             %�����Ŀ

for i = 1:pairnum
    p = rand; %���������
    if p < Px %��������С�ڽ�����ʣ�����н������
        [newpop(:,:,pairs(i,1)),newpop(:,:,pairs(i,2))] = ...
           Ncross_sp(oldpop(:,:,pairs(i,1)),oldpop(:,:,pairs(i,2))); %���㽻��
    else
        newpop(:,:,pairs(i,1)) = oldpop(:,:,pairs(i,1));
        newpop(:,:,pairs(i,2)) = oldpop(:,:,pairs(i,2));
    end
end

end

