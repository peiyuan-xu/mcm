function SelCh = Reverse( SelCh,D )
%进化逆转函数
%D 各个城市的距离矩阵
[row,col]=size(SelCh);
ObjV=PathLength(D,SelCh);  %计算路线长度
SelCh1=SelCh;
for i=1:row
    r1=randsrc(1,1,[1:col]);
    r2=randsrc(1,1,[1:col]);
    mininverse=min([r1,r2]);
    maxinverse=max([r1,r2]);
    SelCh1(i,mininverse:maxinverse)=SelCh1(i,maxinverse:-1:mininverse);
end
ObjV1=PathLength(D,SelCh1);
index=ObjV1<ObjV;
SelCh(index,:)=SelCh1(index,:);

end

