function ret = Code( lenchrom)
%对染色体进行编码，假设有4 艘船初始在四个角 1 37 1333  1369
%保证起始点为其中一个船的初始位置，不妨设所有的染色体起点均为 1
L=lenchrom;
oneChrom=randperm(L);

first=oneChrom(1,1);
index=find(oneChrom==1);
oneChrom(1,1)=1;
oneChrom(1,index)=first;
ret=oneChrom;

end

