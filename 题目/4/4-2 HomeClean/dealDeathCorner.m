function [newPosition,Roads] = dealDeathCorner( JiQiZhen,oldposition)
%根据机器矩阵 中的 2，生成内部元素为 4 的环，以沿此运动
[row,col]=find(JiQiZhen==2);
[m,n]=size(JiQiZhen);
JiTi=JiQiZhen;
JiTi2=JiQiZhen;
L=length(row);

oldP=oldposition;
PositionOne=[];
PositionTwo=[];
TiaoRoads=[];
TiaoRoads1=[];
TiaoRoads2=[];
%%  1  第一中贴障走法，返回路线，和新的有出路的点，没找到则 fang1Flag=0
% 探测 4 优先向上，再向 左
[f1flag,TiaoRoads,position]=tieZhangOne(JiTi,oldP,L,row,col);
oneFlag=f1flag;
TiaoRoads1=TiaoRoads;
PositionOne=position;

%% 2 第二中探测方案  探测 4 优先向下，再左，再右，在上
[f2flag,TiaoRoads,position]=tieZhangTwo(JiTi,oldP,L,row,col);
twoFlag=f2flag;
TiaoRoads2=TiaoRoads;
PositionTwo=position;    %两个flag 取值只可能为 -1 和 1

if oneFlag==-1 && twoFlag==-1   %两种方案均不行
    Roads=[];
    newPosition=[];
    disp('房间已遍历晚，算法结束');
elseif oneFlag==1 &&twoFlag==-1
    Roads=TiaoRoads1;
    newPosition=PositionOne;
elseif oneFlag==-1 && twoFlag==1
     Roads=TiaoRoads2;
    newPosition=PositionTwo;
else
    L1=length(TiaoRoads1);
    L2=length(TiaoRoads2);
    %选择路线短的那条
    if L1<L2   %选择方案一的
         Roads=TiaoRoads1;
          newPosition=PositionOne;
    else
         Roads=TiaoRoads2;
        newPosition=PositionTwo;
    end
    
end
    

end

