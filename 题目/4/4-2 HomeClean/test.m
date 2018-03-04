%%  清理房间
%clc,clear;
%% 1 变量的初始化赋值
%BuLength=10;
%JiQiZhen=[];
position=[2,2];  %当前位置
JiQiRoad=[];
JiQiRoad=[JiQiRoad;position];
%JiQiZhen(1,1)=2;JiQiZhen(1,2)=2;JiQiZhen(2,1)=2;
% 更新机器矩阵的邻域？？？？？？？？？？？？？？？？将初始点加入路线

%% 2 房屋环境的生成，输入房屋长和宽，分隔步长，以及障碍物的个数+对应障碍多边形顶点的坐标,
     %输出房屋环境映射的矩阵，障碍物用先 2 表示
  %HuanJing=createHuanJing();
  HuanJing=Shangyi;
  [m,n]=size(HuanJing);
  JiQiZhen=HuanJing;
  JiQiZhen(2:m-1,2:n-1)=0;
  JiQiZhen(2,2)=3;
  JiQiZhen(3,2)=HuanJing(3,2);JiQiZhen(2,3)=HuanJing(2,3);
%% 3 机器通过不断探测找寻路径，终止条件为矩阵为满
ZhongFlag=panDuanZhong(JiQiZhen);     % input JiQiZhen 和 HuanJing 矩阵，判断机器矩阵是否全部填满,满返回1，不满 0
oldPosition=position;
while ZhongFlag==1
    [DirectionFlag,newPosition]=findDirection(JiQiZhen,oldPosition);  %判断四个方向的情况，可以向左为 1，向上2，向下3，向右4，都不可0
    %如果可以直接走，Flag为 1 ，否则flag为 0，为 1 时并返回下一步的坐标，否则为空
    if DirectionFlag==1   %按照position坐标进行前进，
        Position=newPosition;
    else 
        %寻找，机器矩阵中有路可走的并且最近的点,存到positon
       % Position=selectPosition(JiQiZhen,oldPosition);
        %记录从oldposition 到Position 的 路线 ？？？？？？？？？？？？？跳跃路线的记录
        [newPosition,TiaoRoads]=dealDeathCorner(JiQiZhen,oldPosition);
        JiQiRoad=[JiQiRoad;TiaoRoads];
        Position=newPosition;
    end
    oldPosition=Position;   %更新当前位置
    
    %% 4 更新机器矩阵（如果探测到周围为障碍物，则将其加入到该矩阵中），记录机器的路径
    [JiQiZhenTi,JiQiRoadTi]=adapt(JiQiZhen,JiQiRoad,Position,HuanJing);
    JiQiZhen=JiQiZhenTi;JiQiRoad=JiQiRoadTi;
    %更新终止条件
    ZhongFlag=panDuanZhong(JiQiZhen);  
end