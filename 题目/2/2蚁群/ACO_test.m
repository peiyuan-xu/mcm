%% 本程序为基本的蚁群算法程序，没有对其进行改进，可以解决TSP问题，输入各个城市的坐标

%% C n个城市的坐标，n×2的矩阵
%% NC_max 最大迭代次数
%% m 蚂蚁个数
%% Alpha 表征信息素重要程度的参数
%% Beta 表征启发式因子重要程度的参数
%% Rho 信息素蒸发系数
%% Q 信息素增加强度系数
%% R_best 各代最佳路线
%% L_best 各代最佳路线的长度
%clc,clear;
%% 第一步，变量的初始化，开始每条边的信息量都相等
%输入城市坐标，返回城市规模N ，距离矩阵D 
% a 的demand=[0;demand];
demand=cxuqiu;
[m, n ,D ,C]=input_C(cplot,demand,38,8);
%n=33   病区为32 个
Time=D./5.4; %33*33
%下面的TimeDown TimeEnd 为32*32
% a 的 TimeDown=[0;timedown];
TimeDown=ctimedown;
%每个蚂蚁此时走的路目前耗时
PathEndTime=zeros(m,1);
%TimeEnd 每个点需要的最晚时间
TimeEnd=zeros(n,1);
%a 的TimeEnd=[inf;timeend];
TimeEnd=cendtime;
%病区的需求  XuQiu=input('输入每个病区的需求量：');
%a 的 XuQiu=[0;xuqiu];
XuQiu=cxuqiu;

%input（‘蚂蚁的车存’）
CarCun=ones(m,1)*120;
%趟数 ????? 不能用length(PathTiaoEndNode)求，少一
PathTiao=ones(m,1);
PathTiaoEndNode=zeros(m,n);
%对应车最后的剩余量
CarEndCun=-9*ones(m,n);

%Eta 为启发因子，设为距离的倒数
Eta=1./D;
%Tau为信息素矩阵
Tau=ones(n,n); 

%Tabu 记录生成路径
Tabu=zeros(m,n);

%设置最大迭代次数
NC_max=50;
NC=1;
R_best=zeros(NC_max,n);       %各代最佳路线
R_bestEnd=zeros(NC_max,n);
L_best=inf.*ones(NC_max,1);   %各代最佳路线的长度
L_ave=zeros(NC_max,1);        %各代路线的平均长度
R_bestEnd=zeros(NC_max,n);
 R_bestTiao=zeros(NC_max,1);
 R_bestRoadL=zeros(NC_max,1);
 R_bestCarCun=zeros(NC_max,n);

%%迭代实现，一群蚂蚁全体NC_max寻找食物
while NC<=NC_max
    %%第二步：将m只蚂蚁放到开始的药店
    
Tabu(:,1)=1; %所以蚂蚁均从  其实药店 开始
%所有路目前耗时初始化为 0
%清零
 
     
 %%第三步：m只蚂蚁按概率函数选择下一座城市，完成各自的周游
 
 for j=2:n
     for i=1:m   %选定  第i 只蚂蚁 外层 j 次循环  要去掉一个点
         visited=Tabu(i,1:(j-1)); 
         J=zeros(1,(n-j+1));  
         P=J;      %确定下一访问的城市要根据信息量确定的概率
         %下面确定 蚂蚁i 未访问的城市的序号
         jn=1;
         for k=1:n   
             if length(find(visited==k))==0
                 J(jn)=k;
                 jn=jn+1;
             end
         end
         % 计算未访问城市的概率，根据ETA启发因子，Tau信息素，确定访问优先级
         % 返回蚂蚁 i 下次要去的城市
         to_visit=select_nextCity(J,visited,Eta,Tau,NC,NC_max);
              
        % TimeEnd 为每个点需要的最晚时间  这个要更新PathEndTime为每条路目前消耗时间
        PathEndTimeI=PathEndTime(i,1); %没加入一点 更新，回原点时更新
        
        %PathEndTime(i,1)=TimeEndTi(i,1)+Time(visited(j-1),to_visit);
         %%加  1 判断 该城市是否满足条件  %判断车存是否够
         
         %如果 能选择下一城市，则返回下一城市的序号 to_visitNew  
         %如果 车要回起点装货，则记录本次路径的终止点序号，并返回新路径的起始点的序号
         
         %%需要添加   变量 XiuQiu  CheCun  Time TimeEnd
         endnode=visited(j-1);
         [to_visitFlag,to]=panDuanCity(n,J,endnode,to_visit,Time,TimeEnd,PathEndTimeI,Eta,Tau,visited,NC,NC_max);  %判断能否选择下一城市 ，能返回 1 否则 返回 0
          % to 为能访问的城市的序号,已经遍历所有点
          
         if to_visitFlag==1  
    
              %判断车存够不,够的话返回 1  不够返回 0
              CarFlag=panDuanCar(CarCun(i,1),XuQiu(to));
              if CarFlag==1
                  to_visitNew=to;
                  %更新车存
                   CarCun(i,1)=CarCun(i,1)-XuQiu(to_visitNew);
                   %更新最终路劲时间
                   PathEndTime(i,1)=PathEndTime(i,1)+Time(visited(j-1),to_visitNew)+TimeDown(to_visitNew);
                  
              else %不够 直接回起点   不考虑再向其他地方运 ，因为各个需求相差较小
                  %返回 下一路径开始点 和上一路径结束点
                  TabuI=Tabu(i,:);
                  [ToNew,PathEnd]=huiYuanDian(J,visited,Eta,Tau,TabuI,NC,NC_max);
                  %更新   i 条蚂蚁的走过 存储路径的 条数的边连 和路径  % 用的包租
                  %PathTiao(i)=[PathTiao(1:length(PathTiao(i))),PathEnd];
                  to_visitNew=ToNew;
                  %记录此时车存
                  CarEndCun(i,:)=noteCarEndCun(CarEndCun(i,:),CarCun(i,1));
                   %重装车存
                   CarCun(i,1)=120;
                   PathTiao(i,1)=PathTiao(i,1)+1;
                   %更新最终路劲时间
                   PathEndTime(i,1)=0;
                   %将新的路径的 到第一个点的时间
                   PathEndTime(i,1)=Time(1,ToNew);
                   
                   % 加入 前路径的最后顶点
                   ZiPathI=addEndNode(PathEnd,PathTiaoEndNode(i,:));
                   PathTiaoEndNode(i,:)=ZiPathI;
                  
              end
         
         else  %不能选择下一城市,即剩余所有点超时 ，蚂蚁回原点，相当于 增加运输趟数
               TabuI=Tabu(i,:);
             [ToNew,PathEnd]=huiYuanDian(J,visited,Eta,Tau,TabuI,NC,NC_max);
             %更新   i 条蚂蚁的走过 存储路径的 条数的边连 和路径  % 用的包租
               
                  %PathTiao(i)=[PathTiao(1:length(PathTiao(i))),PathEnd];
                  to_visitNew=ToNew;
                  
                  %记录此时车存
                  CarEndCun(i,:)=noteCarEndCun(CarEndCun(i,:),CarCun(i,1));
                   %重装车存
                  CarCun(i,1)=120;
                  PathTiao(i,1)=PathTiao(i,1)+1;
                  %更新最终路劲时间
                   PathEndTime(i,1)=0;
                     %将新的路径的 到第一个点的时间
                   PathEndTime(i,1)=Time(1,ToNew);
                  
                   % 加入 前路径的最后顶点
                   ZiPathI=addEndNode(PathEnd,PathTiaoEndNode(i,:));
                   PathTiaoEndNode(i,:)=ZiPathI;
         end
         
       Tabu(i,j)=to_visitNew; 
     end
 end
 %% 第四步 记录本次迭代的最佳路线,返回是第几条蚂蚁的路线
 %最好路径的序号（蚂蚁的序号） 最短路径长度  本次迭代平均距离  各蚂蚁的路长
 [n_bestRoad, road_L]=select_bestRoad(PathTiaoEndNode,Tabu,D,m,n, PathTiao,CarEndCun);
 %L_best(NC,1)=L_bestRoad;   %最优长度
 R_best(NC,:)=Tabu(n_bestRoad,:); %最优路径
 %加上记录 每条路径最终的终点
 R_bestEnd(NC,:)=PathTiaoEndNode(n_bestRoad,:);
 R_bestTiao(NC,1)=PathTiao(n_bestRoad,1);
 R_bestRoadL(NC,1)=road_L(n_bestRoad,1);
 R_bestCarCun(NC,:)=CarEndCun(n_bestRoad,:);
 %L_ave=ave;
 
 %% 第五步 更新信息素
 Tau=adapt_Tau(Tau,Tabu,road_L,m,n,PathTiao);
 
 %%第六步，禁忌表清零，为下次迭代做准备
  disp(['第',num2str(NC),'次迭代']);
   NC=NC+1;
   for i=1:m
   disp(['当次迭代第 ',num2str(i),'蚂蚁的路线：',num2str(Tabu(i,:))]);
   end
   disp(['当次迭代中最优蚂蚁的路线：',num2str(Tabu(n_bestRoad,:))]);
   disp(['每条路径的末尾顶点：',num2str(PathTiaoEndNode(n_bestRoad,:))]);
   %disp(['输入信息量情况：']);disp(Tau);
  %清零
   Tabu=zeros(m,n);
   PathEndTime(:,1)=0;
   PathTiaoEndNode(:,:)=0;
    %对应车最后的剩余量
   CarEndCun=-9*ones(m,n);
   PathTiao=ones(m,1);
 
end

%% 最后 输出结果    R_best 各代最佳路线 L_best 各代最佳路线的长度
output_result(R_best,C,R_bestTiao,R_bestEnd,R_bestRoadL,R_bestCarCun);





















