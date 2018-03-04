function f= fitness(position )
%计算粒子群中每个个体的适应度，匹配度越高适应度越大
[m,n]=size(position);
f=zeros(m,1);
%真实影长序列
ylN=14;
%问题4的
   TrueYL=[2.392827617
2.353895105
2.313843963
2.272674191
2.23038579
2.186978759
2.142453098
2.096808807
2.050045887
2.002164337
1.953164158
1.903045349
1.85180791
1.799451841
];
for i=1:m
%计算该离子对应的影长序列
w=position(i,1);j=position(i,2);chi=position(i,3);
%flag0=0时，说明该点不合理f=0
[flag0,YingLI]=CalculateYingL(w,j,chi);
%求该影长序列和真实序列的匹配度
%记录影子长度序列
%YingL(i,:)=YingLT';
%第 1 种比较相似函数
%ylMax=max(YingLI);
%newYL=YingLI/ylMax;
%distance=(newYL-TrueYL).^2;
%distance=sum((YingLI-TrueYL).^2);
%f(i,1)=1/sum(distance);
%valueCheng=chengFa2(w,j);%计算是否在范围内
%加入惩罚函数
if flag0==1
    distance=sum((YingLI-TrueYL).^2);
f(i,1)=1/sum(distance);
%xx=sum(YingLI.*TrueYL);
%x1L=(sum(YingLI.^2))^0.5;
%x2L=(sum(TrueYL.^2))^0.5;
%f(i,1)=xx/(x1L*x2L);
%借鉴Toptic法
%fangtyl=(sum(YingLI.^2)).^0.5;
%z=YingLI./fangtyl;
%d=(sum((TrueYL-z).^2)).^0.5;
%d 越小，越相似，适应度越大
%f(i,1)=1/d;
else
    f(i,1)=0;
end
%用相关函数
%FI=corrcoef(YingLI,TrueYL);
%f(i,1)=FI(1,2);
%end
end

end

