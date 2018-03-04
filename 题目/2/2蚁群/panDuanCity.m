function [to_visitFlag,to] = panDuanCity(n,J,endnode,to_visit,Time,TimeEnd,PathEndTime,Eta,Tau,visited,NC,NC_max)
%判断能否选择下一城市 ，能返回 1 否则 返回 0
% to 为能访问的城市的序号,已经遍历 剩下的 所有点
% J 为蚂蚁 i 未访问 个数 jn      Time 为时间表  endnode 为目前路径最后一个点  
% PathEndTime 当前路劲已费时间 1个值
lastTime=Time(endnode,to_visit)+PathEndTime;
if TimeEnd(to_visit,1)>lastTime   %时间宽裕
    to_visitFlag=1;
    to=to_visit;
else  %该点不行  遍历剩下的点
    NoNode=J;
    index=find(NoNode==to_visit);
    NoNode(index)=0;
    %下面确定 蚂蚁i 未访问的城市的序号
    jn=length(J);
    for i=1:jn   %遍历个 jn 个剩余的点，看能否找到适合的
         jn=1;
         for k=1:n   
             if length(find(NoNode==k))==0 %没访问的顶点中
                 NoNode(jn)=k;
                 jn=jn+1;
             end
         end
       zi_to_visit=select_nextCity(J,visited,Eta,Tau,NC,NC_max);  
       if TimeEnd(zi_to_visit)>lastTime   %时间宽裕
              to_visitFlag=1;
              to=zi_to_visit;
              break;
       else
        to_visitFlag=0;
        to=-1;
    end
       end

    end
    
end

