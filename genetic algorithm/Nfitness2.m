function [ fitness ] = Nfitness2( pop,length )
% ��Nfitness2�����ڼ�����Ⱥ�����н��Ӧ�����꼰RosenbrockĿ�꺯��ֵ��
% ע�⣺�����и���
% ���룺pop����Ⱥ��2 * length * num ����
% 
% �����fitness����Ӧ�Ⱦ���[x y z](num * 3)

xmin = -2;  xmax = 2;  %�Ա���xȡֵ��Χ
ymin = -1;  ymax = 3;  %�Ա���yȡֵ��Χ
num = size(pop,3);
fitness = zeros(num,3);
for page = 1:num
    fitness(page,1) = bin2dec(num2str(pop(1,:,page))); %x������תΪʮ����
    fitness(page,2) = bin2dec(num2str(pop(2,:,page))); %y������תΪʮ����
end
fitness(:,1) = xmin + fitness(:,1) * (xmax - xmin)/(2^(length)-1); %��Ӧ����ռ�
fitness(:,2) = ymin + fitness(:,2) * (ymax - ymin)/(2^(length)-1); %��Ӧ����ռ�
X = fitness(:,1);
Y = fitness(:,2);
fitness(:,3) = (1-X).^2 + 100*(Y - X.^2).^2; %�������и���ĺ�����Ӧֵ
end

