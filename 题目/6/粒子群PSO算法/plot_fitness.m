function  plot_fitness( position,z)
%进行画出每次迭代得到的新的位置
%h=figure('Name','显示每次迭代结果');
hold on
plot3(position(1,:),position(2,:),z,'b.','MarkerSize',0.5)

end

