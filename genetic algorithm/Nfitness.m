function [ fitness ] = Nfitness( pop,length )
% ��Nfitness�õ���Ⱥ���н�����꼰��Ŀ�꺯��ֵ��ע�⣺�����и���
%   
% ���룺pop����Ⱥ��2 * length * num ����
% 
% �����fitness����Ӧ�Ⱦ���[x y z](num * 3)
xmin = -10;%���޸�
xmax = 10;%
ymin = -10;%
ymax = 10;%
xbest = 8.3;
ybest = -7.6;
num = size(pop,3);
fitness = zeros(num,3);
for page = 1:num
    fitness(page,1) = bin2dec(num2str(pop(1,:,page)));
    fitness(page,2) = bin2dec(num2str(pop(2,:,page)));
end
fitness(:,1) = xmin + fitness(:,1) * (xmax - xmin)/(2^(length)-1);
fitness(:,2) = ymin + fitness(:,2) * (ymax - ymin)/(2^(length)-1);
X = fitness(:,1);
Y = fitness(:,2);
fitness(:,3) = -(X-xbest).^2-(Y-ybest).^2 ; 
%sin(sqrt((X-xbest).^2+(Y-ybest).^2));%��Ӧֵ����
end

