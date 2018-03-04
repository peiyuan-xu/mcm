function y=createHuanJing4()
L=input('房间长度：');
W=input('房间宽度：');
bu=input('步长：');
%L=380;W=330;bu=40;
y=ones(floor(L/bu)+3,floor(W/bu)+3);
y([1,floor(L/bu)+3],:)=2;
y(:,[1,floor(W/bu)+3])=2;
zs=input('障碍数目：');
%zs=1;
for i=1:zs
    dd=input('第i个障碍的顶点数目：');
    for j=1:dd
        zbz(j,1)=input('顶点横坐标：');
        zbz(j,2)=input('顶点纵坐标：');
        zb(j,1)=floor(zbz(j,1)/bu);
        zb(j,2)=floor(zbz(j,2)/bu);
    end
    %a=round(1+rand(max(zb(:,1))-min(zb(:,1))+1,max(zb(:,2))-min(zb(:,2))+1));
    %a([2:max(zb(:,1))-min(zb(:,1))],[2:max(zb(:,2))-min(zb(:,2))])=2*ones(max(zb(:,1))-min(zb(:,1))-1,max(zb(:,2))-min(zb(:,2))-1);
    y([min(zb(:,1))+1:max(zb(:,1))+1],[min(zb(:,2))+1:max(zb(:,2))+1])=2*ones(max(zb(:,1))-min(zb(:,1))+1,max(zb(:,2))-min(zb(:,2))+1);
end
    
