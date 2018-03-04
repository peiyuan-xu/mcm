function y = keyroad( snode,enode,time )
%snode 记录前顶点 enode 记录后顶点 time 记录两点之间的工作时间
n=10; %顶点数量
earlyst=zeros(1,n);
%earlyst(1,1)=0;
latelyst=inf*ones(1,n);   %记录最早 和 最晚 开始时间

in=length(snode);
for i=1:in   %每次循环更新 对应点的最早时间
    firstid=snode(i);
    nextid=enode(i);
    if earlyst(nextid)<(earlyst(firstid)+time(i))
        earlyst(nextid)=earlyst(firstid)+time(i);
    end
end
%y=earlyst;       

%latelystnode=find(earlyst==max(earlyst));
%late_f_node=latelystnode(1);
%初始化 st(late_f_node)=earlyst(late_f_node);

%初始化latelyst 
maxtime=max([earlyst(10),earlyst(8),earlyst(9)])
latelyst(10)=maxtime;
latelyst(9)=maxtime;
latelyst(8)=maxtime;
for i=in:-1:1 %逆推出最晚开始时间的第一个点
 %每次循环更新 对应点的最晚时间
    firstid=enode(i);
    nextid=snode(i);
    if latelyst(nextid)>(latelyst(firstid)-time(i))
        latelyst(nextid)=latelyst(firstid)-time(i);
    end
end
%输出结果
result=[];
for i=1:n
    if earlyst(i)==latelyst(i)
        result=[result,i];
    end
end
disp('关键路径上的节点依次为：');disp(result);
        
 
 
 
 
 
 
 
 
    

    
    
end

