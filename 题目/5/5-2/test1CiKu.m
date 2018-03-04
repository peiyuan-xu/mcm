%% 1 提取词条，记录其频数和总评论人数
newsIndex=NewIndex; %要提取的新闻的序号
newsL=length(newsIndex);
newsComentNum=NewComentNum;  %新闻的投票人数

%记录变量
CiKu={};Cif=[];Cinum=1;CipepleN=[];  %CipepleN,需要两列，第二列记录状态flag
for i=1:newsL    %第 i 篇文章
    disp(['第 ',num2str(i),' 个新闻']);
    newsXuhao=newsIndex(i);  %第 i 篇文章的实际序号
    FileName=['E:\data\corpus\',num2str(newsXuhao),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);  %将一篇新闻的内容提取到x(;,1)
    [commentFlag,commentIndex]=ismember('comment',x(:,1));
    %提取comment 之前的关键词
    for j=1:commentIndex-1  %遍历每个cell
        charL=length(char(x(j,1)));
        nomalCharFlag=panDuannomalChar(x(j,1));%是正常字符则返回 1 ，否则返回 0
        if charL>1 &&nomalCharFlag==1 %字符长度>1时记录
            [haveciFlag,ciIndex]=ismember(x(j,1),CiKu);
            if haveciFlag==1  %词库中存在
                Cif(ciIndex,1)=Cif(ciIndex,1)+1;
                if CipepleN(ciIndex,2)==0  %对于本词条该新闻的票数没有加入
                CipepleN(ciIndex,1)=CipepleN(ciIndex,1)+newsComentNum(i);
                CipepleN(ciIndex,2)=1;  %标志添加过
                end
            else %词库中不存在
                CiKu(Cinum,1)=x(j,1);
                Cif(Cinum,1)=1;
                CipepleN(Cinum,1)=newsComentNum(i); %记录词条属于的文章的票数
                CipepleN(Cinum,2)=1;  %1 表示，该词条已计入本新闻的票数，遍历本新闻时，不需对该词条更新票数
                Cinum=Cinum+1;
            end
        end
    end
    fclose(fid);
    %初始，更新CipepleN的状态变量,统计下篇文章
    CipepleN(:,2)=0;
    
end

%% 2 生成特征矩阵
    