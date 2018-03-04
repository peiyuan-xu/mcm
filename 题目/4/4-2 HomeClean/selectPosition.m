function position = selectPosition( JiQiZhen,oldPosition )
%寻找，机器矩阵中有路可走的并且最近的点,存到positon
oldx=oldPosition(1);
oldy=oldPosition(2);
[row,col]=find(JiQiZhen==1);
L=length(row);
pJuLi=inf*ones(L,1);
for i=1:L    %计算 机器中0 的点 离当前死角位置的距离
    x=row(i);y=col(i);
    pJuLi(i,1)=(x-oldx)^2+(y-oldy)^2;
end
[~,Srx]=min(pJuLi);
px=row(Srx);
py=col(Srx);
position=[px,py];

end

