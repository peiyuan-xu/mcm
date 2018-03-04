%% 仿真太阳影子长度的变化
%% 1 变量初始化
H=3;%杆长
weiSita=39+54/60+26/3600; %纬度，北纬为正
chiwei=-10-50/60;   %赤纬角
jingSita=116+23/60+29/3600;  %经度，东经为正
%计算，本经纬度下的正午时间
HereT=12+(3+36/60+31/3600)*4/60;
%时间序列T,时间点个数N
N=121;
T=ChuT;
HSita=zeros(N,1); %记录每个时刻点的太阳高度角
YingL=zeros(N,1);  %记录每个时刻点的影子长度

%% 2 求影长序列
for i=1:N %每次处理一个时间点
    t=T(i,1);
    ITimeSita=(t-HereT)*15;  %时间角
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    hsita=asind(sinH);  %太阳角
    HSita(i,1)=hsita; 
    yl=3/tan(hsita/180*pi);  %影长
    YingL(i,1)=yl;
end

%% 3 显示结果
figure    %影长变化
plot(T,YingL);
xlabel('时间/小时'),ylabel('影长/米');
%axis[];
figure  %太阳角变化
plot(T,HSita);
xlabel('时间/小时'),ylabel('太阳高度角/度');