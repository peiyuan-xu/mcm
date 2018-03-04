clc,clear;
liu=zeros(9,9);
% 容量矩阵为上半部分
for i=1:8
    for j=(i+1):9
        if rand()<0.8
            liu(i,j)=ceil(9*rand());
        else
            liu(i,j)=0;
        end
    end
    
end
disp('随机产生的容量矩阵为：');disp(liu);

%接下来用Lingo进行优化求解