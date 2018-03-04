function y = output_result( L_best,R_best,C)
%最终输出结果
index=find(L_best==min(L_best));
%index=L_best_f(1);
route=R_best(index(1),:);
length=L_best(index(1),1);
disp('最优的路径为：');disp(route);
disp('最短的路径距离为：');disp(length);

x=[];y=[];
[nn n]=size(route);
for i=1:n
    hold on
    x=[x;C(route(1,i),1)];%,C(route(1,i),2)];
    y=[y;C(route(1,i),2)];
   % y=[y;C(route(1,(i+1)),1),C(route(1,(i+2)),2)];
end
x=[x;C(route(1,1),1)];
y=[y;C(route(1,1),2)];
plot(x,y,'o-'),title('TSP最优路径');
axis([0 10 0 10]);

end

