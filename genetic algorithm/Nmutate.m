function [ newpop ] = Nmutate( oldpop, Pm )
%��Nmutate�Ծ���Ⱥ���б���õ�����Ⱥ��
%
% ���룺oldpop������Ⱥ
%       Pm    ���������
%
% �����newpop������������Ⱥ

[~,length,num] = size(oldpop);
newpop = oldpop;
for page = 1:num
    p = rand;  %���������
    if p < Pm  %��������������
        pos = ceil(length * rand); %���ѡһ��λ�ý��б���
        newpop(:,pos,page) = not(oldpop(:,pos,page));   
    end
end
        
end

