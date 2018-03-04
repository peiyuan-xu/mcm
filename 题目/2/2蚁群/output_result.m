function y = output_result(R_best,C,R_bestTiao,R_bestEnd,R_bestRoadL,R_bestCarCun)
%最终输出结果
%先考虑趟数，再然后距离和车存
c1=0.5;c2=0.5;
index=find(R_bestTiao==min(R_bestTiao));
lindex=length(index);
if lindex==1 %据此条件选最优 ，即趟数最少的
    bestindex=index;
else
    %根据 距离和车存判断
    for i=1:lindex
        antI=index(i);
    bestGoal(antI,1)=c1*R_bestRoadL(antI,1)+c2*sum(R_bestCarCun(antI,:));
    end
    index=find(bestGoal==min(bestGoal));
    index=index(1);
    bestindex=index;
end


route=R_best(bestindex,:); %一行 多列
endNode=R_bestEnd(bestindex,:);
tang=R_bestTiao(bestindex,1);
lengthR=R_bestRoadL(bestindex,1);
carcun=R_bestCarCun(bestindex,:);
disp('最优的路径为：');disp(route);
disp('途中车回到原点的病区序号：');disp(endNode);
disp('最优路线趟数为：');disp(tang);
disp('最优路线总长度为：');disp(lengthR);
disp('最优路线的每次车存余量为：');disp(carcun);

x=[];y=[];
[nn n]=size(route);
for i=1:n
    x=[x;C(route(1,i),1)];%,C(route(1,i),2)];
    y=[y;C(route(1,i),2)];
   % y=[y;C(route(1,(i+1)),1),C(route(1,(i+2)),2)];
end
x=[x;C(1,1)];
y=[y;C(1,2)];
plot(x,y,'-');title('TSP最优路径');

  
    
%hold on
%plot(C(1,1),C(1,2),'p');

end

