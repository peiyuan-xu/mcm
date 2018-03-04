function ZiPathI = addEndNode( PathEnd,PathTiaoEndNodeI )
 % 加入 前路径的最后顶点 蚂蚁 i 的
 indexI=find(PathTiaoEndNodeI==0);
 indexI=indexI(1);
 ZiPathI=PathTiaoEndNodeI;
 ZiPathI(indexI)=PathEnd;

end

