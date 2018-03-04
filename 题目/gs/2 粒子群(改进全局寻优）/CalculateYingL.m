function YingL = CalculateYingL(wsita,jsita )
%% 求太阳影子长度的变化,输入wsita,jsita,转换后的经纬度，单位度
%% 1 变量初始化
H=3;%杆长
%weiSita=39+54/60+26/3600; %纬度，北纬为正
weiSita=wsita;jingSita=jsita;
chiwei=10;   %赤纬角
%jingSita=116+23/60+29/3600;  %经度，东经为fu
%计算，本经纬度下的正午时间

%！！！！！！！！！！！
%HereT=12+(120-jingSita)*4/60;
%时间序列T,时间点个数N
N=21;
T=[14.7000
   14.7500
   14.8000
   14.8500
   14.9000
   14.9500
   15.0000
   15.0500
   15.1000
   15.1500
   15.2000
   15.2500
   15.3000
   15.3500
   15.4000
   15.4500
   15.5000
   15.5500
   15.6000
   15.6500
   15.7000];
HSita=zeros(N,1); %记录每个时刻点的太阳高度角
YingL=zeros(N,1);  %记录每个时刻点的影子长度
%%  ！！！！！！！！！
Tutc=T-8;
HereT=Tutc-24/360*jingSita;
%% 2 求影长序列
for i=1:N %每次处理一个时间点
    %t=T(i,1);
    ITimeSita=(HereT(i)-12)*15;  %时间角
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    hsita=asind(sinH);  %太阳角
    HSita(i,1)=hsita; 
    yl=H/tan(hsita/180*pi);  %影长
    YingL(i,1)=yl;
end


end

