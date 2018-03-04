%% 给出影子顶点坐标，求真实的影长
X=x;Y=y;
yL=((x).^2+(y).^2).^0.5;
maxyL=max(yL);
yL=yL/maxyL;