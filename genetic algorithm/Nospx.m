function [ newr1,newr2 ] = Nospx( oldr1,oldr2 )
%Nospx�����������������ִ�е���˳�򽻲�OSPX
% 
% ���룺oldr1�������游��1(��������
%       oldr2�������游��2����������
%
% �����newr1��������Ӵ�1����������
%       newr2��������Ӵ�2����������

n = length(oldr1);
pos = ceil((n-1)*rand); %�������һ������λ��
xr1 = oldr1(pos+1:n);   %oldr1�д����沿��
xr2 = oldr2(pos+1:n);   %oldr2�д����沿��
for i = 1:length(xr2)   %��oldr1����Ԫ��ɾ��
    oldr1(oldr1==xr2(i))=[];
end
for i = 1:length(xr1)   %��oldr2����Ԫ��ɾ��
    oldr2(oldr2==xr1(i))=[];
end
newr1 = [xr2,oldr1];   %�ϳ�������1
newr2 = [xr1,oldr2];   %�ϳ�������2

end

