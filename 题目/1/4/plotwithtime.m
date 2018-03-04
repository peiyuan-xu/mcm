% 假设 随时间 价格成下降趋势

figure;
[m,n]=size(pplot);
%价格变化趋势
%subplot(2,2,1);
plot([1:n-1],yandbu(1,:),'-p');
xlabel('时间');ylabel('蔬菜价格(单位：元)');title('蔬菜价格变化图');
axis([1 60 2 3.6]);

%居民支出
figure;
zhichu=zeros(1,n);
zhichu=pplot(1,:).*pplot(2,:);
%subplot(2,2,2);
plot([1:n],zhichu,'-p');
xlabel('时间');ylabel('居民支出（单位：万元）');title('居民支出变化图');
axis([1 60 80 100]);
figure;
%政府补贴
%subplot(2,2,3);
plot([1:n-1],yandbu(2,:),'-p');
xlabel('时间');ylabel('政府补贴（单位：万元）');title('政府补贴变化图');
axis([1 60 0 1]);

%蔬菜数量随时间变化
figure;
plot([1:n],pplot(1,:),'-p');
xlabel('时间');ylabel('蔬菜产量（单位：吨）');title('蔬菜产量变化图');




