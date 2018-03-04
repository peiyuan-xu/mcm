function [f2flag,tiaoroads,position ] = tieZhangTwo(jiTi,oldP,L,row,col )
%贴障方案 2
TiaoRoads=[];
%先向下 左  右  上
[m,n]=size(jiTi);
oldp=oldP;
JiTi=jiTi;
for i=1:L  %每次循环处理一个元素为2 的四周,此时以八方位
    x=row(i);y=col(i);
    if (x-1>1&&x-1<m) && (y>1&&y<n) && (JiTi(x-1,y)==3)  %被走过
        JiTi(x-1,y)=4;  
    end
     if (x+1>1&&x+1<m) && (y>1&&y<n) && (JiTi(x+1,y)==3)  %被走过
        JiTi(x+1,y)=4;  
     end
      if (x>1&&x<m) && (y-1>1&&y-1<n) && (JiTi(x,y-1)==3)  %被走过
        JiTi(x,y-1)=4;  
      end
     if (x>1&&x<m) && (y+1>1&&y+1<n) && (JiTi(x,y+1)==3)  %被走过
        JiTi(x,y+1)=4;  
     end
     %左上
      if (x-1>1&&x-1<m) && (y-1>1&&y-1<n) && (JiTi(x-1,y-1)==3)  %被走过
        JiTi(x-1,y-1)=4;  
      end
      %右上
        if (x-1>1&&x-1<m) && (y+1>1&&y+1<n) && (JiTi(x-1,y+1)==3)  %被走过
        JiTi(x-1,y+1)=4;  
        end
    %左下
      if (x+1>1&&x+1<m) && (y-1>1&&y-1<n) && (JiTi(x+1,y-1)==3)  %被走过
        JiTi(x+1,y-1)=4;  
      end
    %右下
      if (x+1>1&&x+1<m) && (y+1>1&&y+1<n) && (JiTi(x+1,y+1)==3)  %被走过
        JiTi(x+1,y+1)=4;  
    end
    
end

%优先探测 下 左 右 上 
Flag=0;
while Flag==0  %终止条件为 1
    [diFlag,newP]=tiaoFindDir2(JiTi,oldp);  %diFlag 表示该点是否有出路，有则为 1，否则为0
     if diFlag~=-1   %可以继续探测，1--该位置有出路 0--该位置没出路还可以继续探测
    TiaoRoads=[TiaoRoads;newP];
    JiTi(newP(1,1),newP(1,2))=3; %表示走过，
    oldp=newP;
    Flag=diFlag;
    else  %贴障方案2 已达到无路可走
        Flag=-1;
        newP=[];TiaoRoads=[];
        break;
     end
end
f2flag=Flag;
tiaoroads=TiaoRoads;
position=newP;


end

function [diflag,newp]=tiaoFindDir2(JiTi,oldp)
%探测出下一要走的点，并判断该点是否有出路
%% %先向下 左  右  上
%第二种优先方向 下 右 左，上，将经过的方格的值重新设为 3
%% 可以走的（内环）用 4 表示，走过的用3 ，障碍用2
x=oldp(1);
y=oldp(2);  %矩阵中的位置
if JiTi(x+1,y)==4
   %下边可以走
   p=[x+1,y];
   tflag=haveRoads2(JiTi,p);
elseif JiTi(x,y-1)==4 %左
    p=[x,y-1];
    tflag=haveRoads2(JiTi,p);
elseif JiTi(x,y+1)==4%右
    p=[x,y+1];
     tflag=haveRoads2(JiTi,p);
elseif  JiTi(x-1,y)==4%上
    p=[x-1,y];
     tflag=haveRoads2(JiTi,p);
else
    tflag=-1;   %没有 4 的环了，无法继续探测
    p=[];
  disp('机器矩阵形成的内环没有联通，说明此时已清理完毕');
end

diflag=tflag;
newp=p;

end

function  f=haveRoads2(JiTwo,p)
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















