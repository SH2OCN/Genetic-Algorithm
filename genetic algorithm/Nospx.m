function [ newr1,newr2 ] = Nospx( oldr1,oldr2 )
%Nospx对输入的两个行向量执行单点顺序交叉OSPX
% 
% 输入：oldr1：待交叉父代1(行向量）
%       oldr2：待交叉父代2（行向量）
%
% 输出：newr1：交叉后子代1（行向量）
%       newr2：交叉后子代2（行向量）

n = length(oldr1);
pos = ceil((n-1)*rand); %随机生成一个交叉位置
xr1 = oldr1(pos+1:n);   %oldr1中待交叉部分
xr2 = oldr2(pos+1:n);   %oldr2中待交叉部分
for i = 1:length(xr2)   %对oldr1进行元素删除
    oldr1(oldr1==xr2(i))=[];
end
for i = 1:length(xr1)   %对oldr2进行元素删除
    oldr2(oldr2==xr1(i))=[];
end
newr1 = [xr2,oldr1];   %合成新向量1
newr2 = [xr1,oldr2];   %合成新向量2

end

