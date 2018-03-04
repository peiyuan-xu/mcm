function newchrom= tiaoZhengChrom( oldchrom)
%调整路线，保证起点和终点均为 1，即省会
[num,sizeL]=size(oldchrom);

for i=1:num
    index=find(oldchrom(i,:)==1);
    thuan=oldchrom(i,1);
    oldchrom(i,1)=1;
    oldchrom(i,index)=thuan;
end
newchrom=oldchrom;
end

