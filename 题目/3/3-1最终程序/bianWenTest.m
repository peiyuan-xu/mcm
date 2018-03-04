%% 改变外界温度，求平衡温度分布
WenQ=[-1.6 1.5 5.2 8.4 12.3 15.9 15.7 14.7 12.9 8.7 2.9 -1.2];
WenD=-15;
Dd=[20;50;100;110;510];
h=10;
%最深
m=floor(Dd(5)/h);
J=length(WenQ);

WenP=zeros(m,J);
WenZ=zeros(1,J);
FenHSum=zeros(4,12);
for jWq=1:J  %每次一个月份
    disp(['第 ',num2str(jWq),'个月']);
    Wenq=WenQ(jWq);
    Wend=WenD;
    [WenPing,WenZero,FenH]=wenfen(Dd,Wenq,Wend,h,jWq);
    WenP(:,jWq)=WenPing;
    WenZ(1,jWq)=WenZero;
    FenHSum(:,jWq)=FenH;
   %绘制三维温度传导图
   %figure(jWq);
   %meshThree(WenPing);
end
    