function valueOfcheng = chengFa( wsita,jsita )
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
    hsita=asind(sinH);  %太阳角
    FangWeiSita(i)=(sinH*sin(wsita/180*pi)-sin(chiwei/180*pi))/(cos(hsita/180*pi)*cos(wsita/180*pi));
    FangWeiSita(i)=acosd(FangWeiSita(i));
end


%根据所给数据得到实际的影子变化角
earlySita=64.37;endSita=71.44;
earlyScope=[61.15,67.59];endScope=[67.87,75.01];
if FangWeiSita(1)<earlyScope(1)
    Dearly=earlyScope(1)-FangWeiSita(1);
elseif FangWeiSita(1)>earlyScope(2)
    Dearly=FangWeiSita(1)-earlyScope(2);
else
    Dearly=0;
end

if FangWeiSita(2)<endScope(1)
    Dend=endScope(1)-FangWeiSita(2);
elseif FangWeiSita(2)>endScope(2)
    Dend=FangWeiSita(2)-endScope(2);
else
    Dend=0;
end
valueOfcheng=Dearly+Dend;
end

