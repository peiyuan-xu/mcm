clc;
%初始化粒子群,假设每个离子有 4 的变量 1-x 2-y 3-H 4-c
N=input('输入初始粒子群的个数');

%？？？？？？？？需要调整的，根据所得的直角坐标的范围，即求解范围
position=[2*rand(1,N)+113;rand(1,N)+30;40*rand(1,N);500*rand(1,N)];   %保存位置信息
R=6371000;
C=2*pi*R;
deltC=C/360;
for i=1:10
    loc(i,1)=(location(i,1)-location(1,1))*deltC;
    loc(i,2)=(location(i,2)-location(1,2))*deltC;
end

position(1,:)=(position(1,:)-location(1,1))*deltC;
position(2,:)=(position(2,:)-location(1,2))*deltC;
%污染源位置坐标转化

pbest=zeros(4,N);    %保存每个离子历史最有位置
gbest=zeros(4,1);    %粒子群历史最优位置
fvalue=zeros(1,N);   %记录每个离子历史最优的的fitness value
pfvalue=zeros(1,N);%记录每个离子当前的 fitness value
Vf=rand(2,N);   %记录每个离子的速度

%进行循环，假设最大迭代次数为10000
num=1;
%？？？？4 个变量迭代可能很慢，这里的迭代次数也可以调整
while (num<100)
    
    %对每个离子计算fitness value
    %检查并更新每个离子的历史最优位置pbest
    %？？？？自适应度函数使我们本题的要全改
    [fvalue pbest]=fitness(position,pbest,fvalue);
    
    %选出粒子群中最优的历史位置
    gbest=selectgbest(fvalue,pbest);
    
    %？？？？这个更新函数是很普通的，如果有更好的可以调整一下
    %计算并更新各个离子的的位置，和速度
    [position Vf]=updatep(position,Vf,pbest,gbest);
    num=num+1;
    disp(['当前迭代次数：',num2str(num)]);
end
%对最后一次进行更新，更新最优位置
 [fvalue pbest]=fitness(position,pbest,fvalue);
 gbest=selectgbest(fvalue,pbest);

disp(['最优X位置是：',num2str(gbest(1,1))]);
disp(['最优Y位置是：',num2str(gbest(2,1))]);

disp(['最优H位置是：',num2str(gbest(3,1))]);
disp(['最优c浓度是：',num2str(gbest(4,1))]);
fvaluebest=max(fvalue);
disp(['最优函数值为：',num2str(fvaluebest)]);



