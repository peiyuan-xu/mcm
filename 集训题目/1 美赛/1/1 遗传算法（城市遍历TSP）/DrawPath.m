function  DrawPath( Chrom,X)
%画出所给路线的轨迹图
%Chrom 待花路线  X 各个城市的坐标
R=[Chrom(1,:),Chrom(1,1)];  %一个巡回路线
figure;
hold on
plot(X(:,1),X(:,2),'o','color',[0.5,0.5,0.5])
plot(X(Chrom(1,1),1),X(Chrom(1,1),2),'rv','MarkerSize',20)
for i=1:size(X,1)
    text(X(i,1)+0.05,X(i,2)+0.05,num2str(i),'color',[1,0,0]);
end
A=X(R,:);
row=size(A,1);
for i=1:row-1
    %[arrowx,arrowy]=dsxy2figxy(gca,A(i-1:i,1),A(i-1:i,2)); %坐标转换
    %arrowx=[X(Chrom(i),1),X(Chrom(i),2)];
    %arrowy=[X(Chrom(i+1),1),X(Chrom(i+1),2)];
    arrowx=[A(i,1),A(i+1,1)];arrowy=[A(i,2),A(i+1,2)];
    plot(arrowx,arrowy);
end
hold off
xlabel('横坐标')
ylabel('纵坐标')
box on

end

