function f = fitness(x,D)
%对染色体进行编码首位置为 1，假设有4 艘船初始在四个角 1 37 1333  1369
%fitness 越小越好

speed=2;
index=zeros(1,4);
index(1)=1;
index(2)=find(x==37);
index(3)=find(x==1333);
index(4)=find(x==1369);
%4 个船将区域分为 4 部分
sIndex=sort(index);
Time=zeros(4,1);

for i=1:4 %每次循环处理一只船的时间
    IChrom=[];
   if i==4
       nEnd=1369+1;
   else
       nEnd=sIndex(i+1);
   end
   
   iLength=nEnd-sIndex(i)-1;
   if iLength>0  %当两个船 之间存在要走区域时，计算遍历时间
       IChrom=x(1,sIndex(i):(nEnd-1));
       ITime=calculateTime(IChrom,D,speed);
       Time(i,1)=ITime;
   else
       Time(i,1)=0;
   end
end
f=max(Time);

end

