function [DirectionFlag,position] = findDirection(Jiqizhen,oldposition )
%%判断四个方向的情况，可以向左为 1，向上2，向下3，向右4，都不可0
%如果可以直接走，Flag为 1 ，否则flag为 0，为 1 时并返回下一步的坐标，否则为空

%% 可以走的用 1 表示，走过的用3 ，障碍用2
x=oldposition(1);
y=oldposition(2);  %矩阵中的位置
if Jiqizhen(x,y-1)==1
   %左边可以走
   p=[x,y-1];
   flag=1;
elseif Jiqizhen(x-1,y)==1
    p=[x-1,y];
    flag=1;
elseif Jiqizhen(x+1,y)==1
    p=[x+1,y];
    flag=1;
elseif  Jiqizhen(x,y+1)==1
    p=[x,y+1];
    flag=1;
else
    flag=0;
    p=[];
end

DirectionFlag=flag;
position=p;
   

end

