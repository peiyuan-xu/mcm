%% 得到相似矩阵
teZhen=teZhenCi;  %特征项
newsIndex=NewIndex; %要提取的新闻的序号
newsL=length(newsIndex);

tL=length(teZhen);
T=zeros(tL,newsL);  %相似矩阵
for k=1:newsL   %每次检索一篇文章
    disp(['第 ',num2str(i),' 个新闻']);
    newsXuhao=newsIndex(i);  %第 i 篇文章的实际序号
    FileName=['E:\data\corpus\',num2str(newsXuhao),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);  %将一篇新闻的内容提取到x(;,1)
    [commentFlag,commentIndex]=ismember('comment',x(:,1));
    %提取comment 之前的关键词
    
     for i=1:tL  %更新所有特征词的相似矩阵
          [oneCiFlag,oneCiIndex]=ismember(teZhen(i),x(:,1));
          if oneCiFlag==1 && oneCiIndex>commentIndex  %统计评论之前的
              T(i,k)=x(oneCiIndex,2);  %记录出现频数