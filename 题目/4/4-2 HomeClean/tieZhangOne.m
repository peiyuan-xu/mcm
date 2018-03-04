function [f1flag,tiaoroads,position] = tieZhangOne( jiTi,oldP,L,row,col)
%贴障函数1 ，
TiaoRoads=[];
[m,n]=size(jiTi);
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
% 探测 4 优先向上，再向 左
Flag=0;
oldp=oldP;
while Flag==0  %终止条件为 1
    [diFlag,newP]=tiaoFindDir(JiTi,oldp);  %diFlag 表示该点是否有出路，有则为 1，否则为0
    if diFlag~=-1    %可以继续探测，1--该位置有出路 0--该位置没出路还可以继续探测
    TiaoRoads=[TiaoRoads;newP];
    JiTi(newP(1,1),newP(1,2))=3; %表示走过，
    oldp=newP;
    Flag=diFlag;
    else  %贴障方案1 已达到无路可走
        Flag=-1;
        newP=[];TiaoRoads=[];
        break;
    end
end

f1flag=Flag;
position=newP;
tiaoroads=TiaoRoads;


end

