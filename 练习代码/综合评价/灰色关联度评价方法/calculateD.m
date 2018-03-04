function [ distance,Dp,DpSum] = calculateD( xN,yN)
%计算对应点的间距,并进行规范化 ，防止相差太大，得到关联系数

[m,n]=size(xN);
D=zeros(m,n);
Dp=zeros(m,n);
for i=1:n
    D(:,i)=abs(yN-xN(:,i));
end
distance=D;

% 得到距离矩阵后 进行规范化 假设分辨系数 P =0.4
p=0.4;
 DmaxI=max(D);
  DmaxI=max(DmaxI);
  disp('DmaxI=');disp(DmaxI);
 DminI=min(D);
 DminI=min(DminI);
 disp('DminI=');disp(DminI);
for i=1:n
    D(:,i)=D(:,i)+p*DmaxI;
    Dmin_P=DminI+p*DmaxI;
    Dp(:,i)=Dmin_P./(D(:,i));
end

DpSum=zeros(n,1);
for i=1:n
DpSum(i)=sum(Dp(:,i))/m;
end

%输出结果
dps=DpSum;
disp('X 中各指标的关联度 依次从高到低：');
for i=1:n
    index=find(dps==max(dps));
    index=index(1);
    disp(['第',num2str(i),' 个关联的指标序号为：',num2str(index), ' 其关联度为：',num2str(dps(index))]);
    
    %在dps 中出掉排列过得 元素
    dps(index)=-inf;
end


end

