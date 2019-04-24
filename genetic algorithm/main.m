%【经典遗传算法】
%目标函数：max z = f(x,y)
%% 目标函数三维图像
clc
clear
format long g  %不使用科学计数法
xmin = -2;  xmax = 2;
ymin = -1;  ymax = 3;
x = xmin:0.01:xmax;
y = ymin:0.01:ymax;
[X,Y] = meshgrid(x,y);
Z = (1-X).^2 + 100*(Y - X.^2).^2; %【Rosenbrock函数:测试最优化算法性能】
mesh(X,Y,Z)
title('Rosenbrock函数');
%% 遗传算法
select_flag = 0 ; % 1—锦标赛; 0—轮盘赌
length = 17;  %二进制编码长度<18
num = 100;    %种群规模
gennum = 500; %最大迭代次数
pop = Ninipop(length,num);      %生成初始种群
allpop = zeros(num,3,gennum);   %保存历代种群及其函数值

for i = 1:gennum  
    fprintf('第 %d 代\n', i);
    allpop(:,:,i) = Nfitness2(pop,length); %计算种群适应值
    
    if select_flag == 1 %根据标志位进行选择操作
        selpop = Nselect_sai(allpop(:,3,i),num,pop); %锦标赛选择
    elseif select_flag == 0
        selpop = Nselect_rws(allpop(:,3,i),num,pop); %轮盘赌选择
    end
    
    crspop = Ncrossover(selpop,0.8);    %单点交叉
    mutpop = Nunimutate(crspop,0.01);   %均匀变异
    pop = mutpop;
    
    if std(allpop(:,3,i)) < 0.01 %如果当代种群函数均值收敛到某个值，进行重启动
        pop = Ninipop(length,num); %重新初始化种群
        fprintf('------重启动------\n');
    end
end
ansfun = permute(allpop(:,3,:),[1 3 2]);
[bestf,I] = max(ansfun(:));
bestf %最优函数值
[I_row, I_col] = ind2sub(size(ansfun),I); %将矩阵元素的索引转为下标
best_X = allpop(I_row,:,I_col); %GA得到的最优解
bx = best_X(1); 
by = best_X(2);
fprintf('最优解：\n x = %d\n y = %d\n',bx,by);
%% 收敛曲线
his_best = zeros(gennum,1); %历代最优值
now_best = max(ansfun);     %当代最优值
now_mean = mean(ansfun);    %当代均值
for gen = 1:gennum
    his_best(gen) = max(max(ansfun(:,1:gen)));
end
plot(his_best)
hold on
%plot(now_best)
%hold on
plot(now_mean)
legend('历代最优值','当代均值')
%% 历代解种群的动态分布
figure(2);
title('历代解种群分布');
for page=1:gennum / 2
    scatter3(allpop(:,1,page),allpop(:,2,page),allpop(:,3,page),15)
    axis([xmin xmax ymin ymax min(allpop(:,3,1)) max(allpop(:,3,1))])
    pause(0.05)
    clf
end
%% 当前代的种群分布
figure(3);
scatter3(allpop(:,1,page),allpop(:,2,page),allpop(:,3,page),15)
axis([xmin xmax ymin ymax min(allpop(:,3,1)) max(allpop(:,3,1))])
plot(allpop(:,1,page),allpop(:,2,page),'x')
title('当前代解种群分布');