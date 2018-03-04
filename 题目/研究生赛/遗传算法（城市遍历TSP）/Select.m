function SelCh = Select( Chrom,FitnV,GGAP )
%GGAP 选择概率  SelCh 被选择的个体  
NIND=size(Chrom,1);
NSel=max(floor(NIND*GGAP+0.5),2);
%NSel　被选择的个数，ChrIx新的种群中个体的序号
ChrIx=Sus(FitnV,NSel);
SelCh=Chrom(ChrIx,:);

end

