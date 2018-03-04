%% 计算频数矩阵 m*5536
teZhen=firstTe;
teL=length(firstTe);

newsIndex=NewIndex; %要提取的新闻的序号,5536篇
newsL=length(newsIndex);
P=zeros(teL,newsL);  %相似矩阵

for k=1:newsL   %每次检索一篇文章
    disp(['第 ',num2str(k),' 个新闻']);
    newsXuhao=newsIndex(k);  %第 i 篇文章的实际序号
    FileName=['E:\data\corpus\',num2str(newsXuhao),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);  %将一篇新闻的内容提取到x(;,1)
    [commentFlag,commentIndex]=ismember('comment',x(:,1));
    %提取comment 之前的关键词
    
    for i=1:teL  %更新所有特征词的相似矩阵
          [oneCiFlag,oneCiIndex]=ismember(teZhen(i),x(:,1));
          if oneCiFlag==1 && oneCiIndex<commentIndex  %统计评论之前的
              P(i,k)=x{oneCiIndex,2};  %记录出现频数
          end
    end
    fclose(fid);
end
    
    %% 对频数矩阵的整理
    %一个 关键词在几个文档中
    CiAppearInFileN=zeros(teL,1);
    for i=1:teL
        [ff,index]=find(P(i,:)>0);
        CiAppearInFileN(i,1)=length(index);
    end
    SumPinInFile=zeros(1,newsL);
    for j=1:newsL  %每个文档中词的总频数
        SumPinInFile(1,j)=sum(P(:,j));
    end
        
    