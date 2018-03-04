%% 1
%本次 现处理一个A 医药点的距离矩阵
Ad=input('输入A中心和各个病区 之间(n+1,n+1)的距离d:');
%% 2  计算节约值 S
[m,n]=size(Ad);
S=zeros(n,n);
%需求 病区的 xuQiu 量
xuQiu=zeros(1,(n-1));
xuQiu=input('输入各个病区的需求量：');
%for k=1:n

for i=2:n  %他有 n 列   注意！！！生成上三角矩阵Cm^2个
    for j=(i+1):n 
           S(i,j)=Ad(1,i)+Ad(1,j)-Ad(i,j);
end
end

%% 将集合S中的元素Sij 从大到小进行排序
JieYueN=n-1;
JieYueSum=JieYueN*(JieYueN-1)/2; %需要排序的个数
%存储 S 的排序
Spai=zeros(JieYueSum,2);

for i=1:JieYueSum   %此处次数上进行了限制
    S==max(max(S)); %此时S 节约的最大值，
    [indexh,indexl]=find(S==max(max(S)));
    Spai(i,1)=indexh;Spai(i,2)=indexl;
    S(indexh,indexl)=0;
end
%% 4 排好序好进入 主要循环 集合 Spai =空，则结束，否则判断其中元素是否满足一下三个条件

% 判断Spai矩阵中 元素是否去掉完  ，去掉完 则返回 0 
RunOr=panDuanKong(Spai);
besti=Spai(1,1);bestj=Spai(1,2);
while RunOr==1
   %是否满足以下三个条件 ,跳转步骤 （5）
   ManFlag=manZuThree(); %满足，则为 1，转（5），否则为 0 ，转（8）
      if ManFlag==1
       % 转 （5）
       else
        %转 （8）
       end
%% 5 病区 i j 的需求总量 besti bestj
    Wsum=xuQiu(besti)+xuQiu(bestj);
   % Wsum >车存 可以运两个地方    <车存 ，继续判断是否可以 够一个地方
   %jiXiuFlag  为 2 可运两个 1 可运1个 0可运0个
   jiXiuFlag=panDuanJiXiu(Wsum,xiuQiu);
   if jiXiuFlag==2
        % 
     elseif jiXiuFlag==1
      %
     else  %1 个也不够回原点药店
       %
     end


RunOr=panDuanKong(Spai);
end

if RunOr==0  %Spai 为空时
disp('算法结束');
end
%结束























