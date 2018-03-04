%画出遍历路线
axis([0,8,0,8]);grid;
x=zeros(32,2);
x(1:8,1)=ones(8,1)*0.5;
x(9:16,1)=ones(8,1)*3.5;
x(17:24,1)=ones(8,1)*4.5;
x(25:32,1)=ones(8,1)*7.5;

hold on;
x(1:8,2)=[0.5;1.5;2.5;3.5;4.5;5.5;6.5;7.5];
x(9:16,2)=x(1:8,2);
x(17:24,2)=x(1:8,2);
x(25:32,2)=x(1:8,2);
plot(x(:,1),x(:,2),'o','color',[0.5,0.5,0.5])
hold on;
%R为记录的路线
R1=[1 9 10 2 3 11 12 4];
plot(x(R1(1,1),1),x(R1(1,1),2),'rv','MarkerSize',20)
plot(x(8,1),x(8,2),'rv','MarkerSize',20)
plot(x(32,1),x(32,2),'rv','MarkerSize',20)
plot(x(25,1),x(25,2),'rv','MarkerSize',20)
A1=x(R1,:);
row=size(A1,1);
hold on;

for i=2:row
    [arrowx,arrowy]=dsxy2figxy(gca,A1(i-1:i,1),A1(i-1:i,2));%坐标转换
    annotation('textarrow',arrowx,arrowy,'HeadWidth',8,'color',[0,0,1]);
end