function f= fitness(position )
%计算粒子群中每个个体的适应度，匹配度越高适应度越大
[m,n]=size(position);
f=zeros(m,1);
%真实影长序列
ylN=21;
TrueYL=[[0.596304178533930;0.613199680749257;0.630367408481833;0.647875460424187;0.665585902488486;
    0.683635322043225;0.701982000906913;0.720666941763752;0.739737128587382;0.759056927444726;
    0.778809717593994;0.798909216833717;0.819460656164860;0.840359465052014;0.861691331039699;
    0.883486869022059;0.905746771747443;0.928488919149548;0.951811148887353;0.975598840114507;1]];
%YingL=zeros(m,ylN);
for i=1:m
%计算该离子对应的影长序列
w=position(i,1);j=position(i,2);
YingLI=CalculateYingL(w,j);
%求该影长序列和真实序列的匹配度
%记录影子长度序列
%YingL(i,:)=YingLT';
%第 1 种比较相似函数
%ylMax=max(YingLI);
%newYL=YingLI/ylMax;
%distance=(newYL-TrueYL).^2;
%f(i,1)=1/sum(distance);

%加入惩罚函数
valueCheng=chengFa2(w,j);
xx=sum(YingLI.*TrueYL);
x1L=(sum(YingLI.^2))^0.5;
x2L=(sum(TrueYL.^2))^0.5;
f(i,1)=10^6*xx/(x1L*x2L)-10^12*valueCheng;
%用相关函数
%FI=corrcoef(YingLI,TrueYL);
%f(i,1)=FI(1,2);
end

end

