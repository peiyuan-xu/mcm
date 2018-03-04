wsita=19.96238;jsita=113.9359; 
%惩罚函数，计算出惩罚值
%通过真实的太阳角，和模拟的太阳角
weiSita=wsita;jingSita=jsita;
chiwei=10; %赤纬角
%计算太阳方向角
FangWeiSita=zeros(2,1);
T=[14.7;15.7];
for i=1:2
    t=T(i);
    tutc=t-8;
    tnew=tutc+12/pi*jingSita;  %此处有个参数，东经为正，西经-
    ITimeSita=15*(tnew-12);
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    hsita=asind(sinH);  %太阳高度角
    FangWeiSita(i)=(sinH*sin(wsita/180*pi)-sin(chiwei/180*pi))/(cos(hsita/180*pi)*cos(wsita/180*pi));
    disp(num2str(FangWeiSita(i)));
    FangWeiSita(i)=acosd(FangWeiSita(i));
   
end
Yj=FangWeiSita(1)-FangWeiSita(2);

%根据所给数据得到实际的影子变化角
yingSita=7.08;
yingSitaScope=[6.726,7.434];
if Yj<yingSitaScope(1)
    dYsita=yingSitaScope(1)-Yj;
elseif Yj>yingSitaScope(2)
    dYsita=Yj-yingSitaScope(2);
else
    dYsita=0;
end
valueOfcheng=dYsita;