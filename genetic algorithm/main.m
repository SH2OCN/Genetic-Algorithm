%�������Ŵ��㷨��
%Ŀ�꺯����max z = f(x,y)
%% Ŀ�꺯����άͼ��
clc
clear
format long g  %��ʹ�ÿ�ѧ������
xmin = -2;  xmax = 2;
ymin = -1;  ymax = 3;
x = xmin:0.01:xmax;
y = ymin:0.01:ymax;
[X,Y] = meshgrid(x,y);
Z = (1-X).^2 + 100*(Y - X.^2).^2; %��Rosenbrock����:�������Ż��㷨���ܡ�
mesh(X,Y,Z)
title('Rosenbrock����');
%% �Ŵ��㷨
select_flag = 0 ; % 1��������; 0�����̶�
length = 17;  %�����Ʊ��볤��<18
num = 100;    %��Ⱥ��ģ
gennum = 500; %����������
pop = Ninipop(length,num);      %���ɳ�ʼ��Ⱥ
allpop = zeros(num,3,gennum);   %����������Ⱥ���亯��ֵ

for i = 1:gennum  
    fprintf('�� %d ��\n', i);
    allpop(:,:,i) = Nfitness2(pop,length); %������Ⱥ��Ӧֵ
    
    if select_flag == 1 %���ݱ�־λ����ѡ�����
        selpop = Nselect_sai(allpop(:,3,i),num,pop); %������ѡ��
    elseif select_flag == 0
        selpop = Nselect_rws(allpop(:,3,i),num,pop); %���̶�ѡ��
    end
    
    crspop = Ncrossover(selpop,0.8);    %���㽻��
    mutpop = Nunimutate(crspop,0.01);   %���ȱ���
    pop = mutpop;
    
    if std(allpop(:,3,i)) < 0.01 %���������Ⱥ������ֵ������ĳ��ֵ������������
        pop = Ninipop(length,num); %���³�ʼ����Ⱥ
        fprintf('------������------\n');
    end
end
ansfun = permute(allpop(:,3,:),[1 3 2]);
[bestf,I] = max(ansfun(:));
bestf %���ź���ֵ
[I_row, I_col] = ind2sub(size(ansfun),I); %������Ԫ�ص�����תΪ�±�
best_X = allpop(I_row,:,I_col); %GA�õ������Ž�
bx = best_X(1); 
by = best_X(2);
fprintf('���Ž⣺\n x = %d\n y = %d\n',bx,by);
%% ��������
his_best = zeros(gennum,1); %��������ֵ
now_best = max(ansfun);     %��������ֵ
now_mean = mean(ansfun);    %������ֵ
for gen = 1:gennum
    his_best(gen) = max(max(ansfun(:,1:gen)));
end
plot(his_best)
hold on
%plot(now_best)
%hold on
plot(now_mean)
legend('��������ֵ','������ֵ')
%% ��������Ⱥ�Ķ�̬�ֲ�
figure(2);
title('��������Ⱥ�ֲ�');
for page=1:gennum / 2
    scatter3(allpop(:,1,page),allpop(:,2,page),allpop(:,3,page),15)
    axis([xmin xmax ymin ymax min(allpop(:,3,1)) max(allpop(:,3,1))])
    pause(0.05)
    clf
end
%% ��ǰ������Ⱥ�ֲ�
figure(3);
scatter3(allpop(:,1,page),allpop(:,2,page),allpop(:,3,page),15)
axis([xmin xmax ymin ymax min(allpop(:,3,1)) max(allpop(:,3,1))])
plot(allpop(:,1,page),allpop(:,2,page),'x')
title('��ǰ������Ⱥ�ֲ�');