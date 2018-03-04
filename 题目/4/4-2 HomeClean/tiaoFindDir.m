function [diFlag,newP] = tiaoFindDir(JiTi,oldP)
%探测出下一要走的点，并判断该点是否有出路
%% 第一个优先方向 ，上 左，右，下  
%第二种优先方向 下 右 左，上，将经过的方格的值重新设为 3

%% 可以走的（内环）用 4 表示，走过的用3 ，障碍用2
x=oldP(1);
y=oldP(2);  %矩阵中的位置
if JiTi(x-1,y)==4
   %上边可以走
   p=[x-1,y];
   tflag=haveRoads(JiTi,p);
elseif JiTi(x,y-1)==4 %左
    p=[x,y-1];
    tflag=haveRoads(JiTi,p);
elseif JiTi(x,y+1)==4%右
    p=[x,y+1];
     tflag=haveRoads(JiTi,p);
elseif  JiTi(x+1,y)==4%下
    p=[x+1,y];
     tflag=haveRoads(JiTi,p);
else
    tflag=-1;   %没有 4 的环了，无法继续探测
    p=[];
  disp('机器矩阵形成的内环没有联通，说明此时已清理完毕');
end

diFlag=tflag;
newP=p;

end

function  f=haveRoads(JiTwo,p)
%判断该位置的方格是否有出路
%有返回1 ，否则返回 0
x=p(1,1);y=p(1,2);
if JiTwo(x-1,y)==1 %被走过
       f=1;
elseif JiTwo(x+1,y)==1
    f=1;
elseif JiTwo(x,y-1)==1
    f=1;
elseif JiTwo(x,y+1)==1
    f=1;
else
    f=0;
end


end
