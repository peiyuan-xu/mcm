function Chrom = Reins( Chrom,SelCh,ObjV)
%重插入子代的新种群
%输入   Chrom 父代种群 Selch 子代种群 Objv 父代适应度
%输出  结合父代和子代后得到的新的种群
NIND=size(Chrom,1);
NSel=size(SelCh,1);
[TobjV,index]=sort(ObjV);
Chrom=[Chrom(index(1:NIND-NSel),:);SelCh];

end

