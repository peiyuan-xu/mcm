function valueOfcheng = chengFa2( wsita,jsita )
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
    tnew=tutc-12/180*jingSita;  %此处有个参数，东经为负，西经+！！！原先有错！！！！！！！！
    ITimeSita=15*(tnew-12);
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    hsita=asind(sinH);  %太阳角
    FangWeiSita(i)=(sinH*sin(wsita/180*pi)-sin(chiwei/180*pi))/(cos(hsita/180*pi)*cos(wsita/180*pi));
    if tnew>12
        FangWeiSita(i)=acosd(FangWeiSita(i));
    else 
        FangWeiSita(i)=-acosd(FangWeiSita(i));
    end
end
Dfwsita=FangWeiSita(2)-FangWeiSita(1);
Dfwsita=FangWeiSita(2)-FangWeiSita(1);
if Dfwsita<0
    Dfwsita=Dfwsita+360;
end

%根据所给数据得到实际的影子变化角
sita=7.08;
sitaScope=[6.73,7.43];
if Dfwsita<sitaScope(1)
    Dend=sitaScope(1)-Dfwsita;
elseif Dfwsita>sitaScope(2)
    Dend=Dfwsita-sitaScope(2);
else
    Dend=0;
end

valueOfcheng=Dend;
end