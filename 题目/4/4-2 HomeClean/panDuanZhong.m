function ZhongFlag = panDuanZhong( JiZhen )
  % 如果jizhen 中没有可去点 0 ，则，认为遍历完成
  %JiTi=JiZhen();
  index=find(JiZhen==1);
  L=length(index);
  if L==0
      ZhongFlag=0;
  else   %有可去之处
      ZhongFlag=1;
  end

end

