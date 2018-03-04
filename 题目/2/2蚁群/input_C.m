function [m, N ,d ,C] = input_C(Aplot,xuQiu,n,M )
%输入入城市坐标，返回距离矩阵
%N=input('输入城市的规模：');
N=n;

C=zeros(N,2);
d=inf.*ones(N,N);
%C=input('输入各个城市的坐标（N行2列）：');
 %XuQiu=input('输入每个病区的需求量：');
C=Aplot;
%m=input('输入蚂蚁的数量：');
m=M;
for i=1:N
    for j=1:i
       if i~=j
        d(i,j)=sqrt((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2);
       else
        d(i,j)=eps;      %i=j时不计算，应该为0，但后面的启发因子要取倒数，用eps（浮点相对精度）表示 
       end
       d(j,i)=d(i,j);  %为对称矩阵
    end
end 
%disp(D);

end

