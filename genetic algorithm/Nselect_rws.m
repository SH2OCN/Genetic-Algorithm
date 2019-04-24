function [ selpop ] = Nselect_rws( fitness,selnum,pop)
% ��Nselect_rws:���̶�ѡ��
%
% ���룺fitness����Ⱥ��Ӧ��������
%       selnum�� Ҫѡ���selnum������
%       pop��ԭ��Ⱥ
%
% �����selpop��ѡ��������Ⱥ
fitness = fitness - min(fitness);%Ҫ��������Ӧֵ��Ϊ�Ǹ���
[oldnum,~] = size(fitness); %�õ�ԭ��Ⱥ��ģoldnum
cumfit = cumsum(fitness);      %�õ���Ӧ���ۻ�ֵ
trials = cumfit(oldnum) .* rand(selnum,1); %���ɵ�selnum�������
Mu = cumfit(:,ones(1,selnum));           %ÿ�����Ӧ���Ͻ�
Md = [zeros(1,selnum);Mu(1:oldnum-1,:)]; %ÿ�����Ӧ���½�
Mt = trials(:,ones(1,oldnum))';          %�������ɶ�Ӧ�ľ�����ʽ
[SelPages,~] = find(Mt >= Md & Mt < Mu); %�õ�ѡ���Ľ�ı��
selpop = pop;
for page = 1:selnum
    selpop(:,:,page) = pop(:,:,SelPages(page));
end
end

