function [ selpop ] = Nselect_sai( fitness,selnum,pop)
% ��Nselect_sai:1v1������ѡ��
%
% ���룺fitness����Ⱥ��Ӧ��������
%       selnum�� Ҫѡ���selnum������
%       pop��ԭ��Ⱥ
%
% �����selpop��ѡ��������Ⱥ
rp1 = randperm(selnum);
rp2 = randperm(selnum);
selpop = pop(:,:,rp1);
pop2 = pop(:,:,rp2);
a = fitness(rp1)<fitness(rp2);
selpop(:,:,a) = pop2(:,:,a);
end

