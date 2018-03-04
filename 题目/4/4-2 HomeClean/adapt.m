function [ JiQiZhenTi,JiQiRoadTi] = adapt(JiQiZhen,JiQiRoad,Position,HuanJing)
%更新机器矩阵（探测到的邻域将其加入到该矩阵中），记录机器的路径
%Position 为新选入的位置
x=Position(1);
y=Position(2);
JiQiZhenTi=JiQiZhen;
JiQiRoadTi=JiQiRoad;

JiQiZhenTi(x,y)=3;
%加入路径
JiQiRoadTi=[JiQiRoadTi;Position];

%判断邻域,1代表可走，2代表障碍，0代表没经过
u=HuanJing(x-1,y);
d=HuanJing(x+1,y);
l=HuanJing(x,y-1);
r=HuanJing(x,y+1);
JiQiZhenTi(x,y)=3;   %机器已在该点
%更新邻域
if JiQiZhenTi(x,y-1)==0
    JiQiZhenTi(x,y-1)=HuanJing(x,y-1);
end
if  JiQiZhenTi(x,y+1)==0
    JiQiZhenTi(x,y+1)=HuanJing(x,y+1);
end
if  JiQiZhenTi(x-1,y)==0
    JiQiZhenTi(x-1,y)=HuanJing(x-1,y);
end
if  JiQiZhenTi(x+1,y)==0
    JiQiZhenTi(x+1,y)=HuanJing(x+1,y);
end
   

end

