staus=10;
for i=1:4 %4次模拟，在x[0~1] y[0~1]的范围内
    point=staus.^i;%模拟的随机点数
    RandData=rand(2,point); %根据随机点数产生随机的散点（x,y）
    Below=find(RandData(1,:).^2>RandData(2,:)); %寻找在曲线下方的点
    BelowData=RandData(:,Below);
    subplot(2,2,i)
    plot(BelowData(1,:),BelowData(2,:),'o')
    OutCome(i)=length(Below)/point; %最终结果
end
