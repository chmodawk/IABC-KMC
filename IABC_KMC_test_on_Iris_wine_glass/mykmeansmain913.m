function mykmeansmain913(x)
fhandle=fopen('D:\桌面\第一篇组合部件\k-means   matlab\data.txt');
x=fscanf(fhandle,'%g     %g     ',[2 inf]);
centerNum=4;            %分类中心的个数,可变
%center=x(:,1:centerNum);%选取初始点
center=[0,0;8,6;8,9;3,2]';
disp('初始聚类中心:');
disp(center);
[datarow,datacolumn]=size(x);
distancedata=zeros(centerNum,datacolumn);
step=1000 ;       %迭代最大次数

%**************9.17**************
class=zeros(1,datacolumn);
classCounterDistance=zeros(datacolumn,2);
%**************9.17**************

%kinddata=zeros(datarow,datacolumn);
 [newCenter,class,classCounterDistance]=caculateCenter2(centerNum,x,datacolumn,datarow,center,class,classCounterDistance);%重新计算聚类中心

while (sum(sum(newCenter~=center)))&step
    i
    center=newCenter; 
    times=1000-step+1;
    fprintf('第%d次迭代，聚类中心为：\n',times);
    %disp('聚类中心为：');
    disp(center);
    
    %**************9.17**************
class=zeros(1,datacolumn);
classCounterDistance=zeros(datacolumn,2);%因为一列是距离值，一列是这个点所属的类，所以是两列
%**************9.17**************
    
   [newCenter,class,classCounterDistance]=caculateCenter2(centerNum,x,datacolumn,datarow,center,class,classCounterDistance);%重新计算聚类中心
    step=step-1;
end
disp('各个点所属的类为：');
disp(class);
disp('各个点与最近的类号以及其距离为：');
disp(classCounterDistance);

plot(x(1,:),x(2,:),'*');
hold on;
for h=1:centerNum
   plot(newCenter(1,h),newCenter(2,h),'+r');
   hold on;
end
grid;
legend('简单的多类类K均值聚类')
    
%sort=sort(data1);  %对距离进行排序
%sort2=sort(data2);
%m=find(data1==sortdata1(2));%找到次小值在的向量
%n=find(data1==sortdata1(2));%
%z11=x(m);
%z22=x(n);
