%%  生成每个新闻的关键词指标矩阵
Citiao=titletxt;
m=length(Citiao);
n=10000;
newF=zeros(m,n);

for i=10001:20000
    disp(['第 ',num2str(i),' 个新闻']);
    FileName=['E:\data\corpus\',num2str(i),'.txt'];
   
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);
    [tFlag,index]=ismember(Citiao,x(:,1));
    for j=1:m
        if tFlag(j)==1 %存在
            xm=index(j);
            onef(j,1)=cell2mat(x(xm,2));
        else
            onef(j,1)=0;
        end
    end
    %更新第一篇新闻对应的列
    newF2(:,i)=onef;
    fclose(fid);
end
    
    
    
