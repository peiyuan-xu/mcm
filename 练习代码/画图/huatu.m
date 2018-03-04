%给定一个矩阵  画出矩阵的连接线

%x=zeros(43);
x=100*rand(4,4);
x(1,1)=0;
x(1,2)=0;

%给点命名
%NodeIDs={'A','B','C','D','E','F','G','H','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35'};
NodeIDs={'A','B','C','D'};
%固定格式
h=view(biograph(x,NodeIDs,'ShowWeights','on'));  %调用VIEW
set(h.Nodes,'shape','circle');%数据点用圆圈包围
h.EdgeType='segmented';%用线段连接
h.LayoutType='equilibrium';%布局图形
dolayout(h);