function [flagI,YingL] = CalculateYingL(wsita,jsita,chi )
%% 求太阳影子长度的变化,输入wsita,jsita,转换后的经纬度，单位度
%% 1 变量初始化
H=2;%杆长
%weiSita=39+54/60+26/3600; %纬度，北纬为正
weiSita=wsita;jingSita=jsita;
chiwei=chi;   %赤纬角
%jingSita=116+23/60+29/3600;  %经度，东经为负，北纬为正
%计算，本经纬度下的正午时间

%HereT=12+(120-jingSita)*4/60;
%时间序列T,时间点个数N
N=14;
T=[8.9000
    8.9500
    9.0000
    9.0500
    9.1000
    9.1500
    9.2000
    9.2500
    9.3000
    9.3500
    9.4000
    9.4500
    9.5000
    9.5500];
Tutc=T-8;
%%  ！！！！！1
HereT=Tutc-24/360*jingSita;%%修改！！！！
HSita=zeros(N,1); %记录每个时刻点的太阳高度角
YingL=zeros(N,1);  %记录每个时刻点的影子长度
flag0=1;

%% 2 求影长序列
for i=1:N %每次处理一个时间点
   % t=T(i,1);
    ITimeSita=(HereT(i)-12)*15;  %时间角
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    if sinH<0
        flag0=0;
        YingL=[];
        break;
    end
        
    hsita=asind(sinH);  %太阳角
    HSita(i,1)=hsita; 
    yl=H/tan(hsita/180*pi);  %影长
    YingL(i,1)=yl;
end
flagI=flag0;

end

