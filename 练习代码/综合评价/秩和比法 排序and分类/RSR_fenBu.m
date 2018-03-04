function [RSR2,Probit] = RSR_fenBu( RSR)
%计算RSR的分布

n=length(RSR);
%直到已处理晚全部元素
num=1;
RI=RSR;
RSR2=[];
R_s=[];
while num<n
    numSum=0;
    index=find(RI==min(RI));
    RSR2=[RSR2;min(RI)];
    il=length(index);
    %将已记录的数据变为最大
    for j=1:il
        numSum=numSum+num;
        num=num+1;
        RI(index(j))=inf;
    end
    %综合百分比
    numsum_p=numSum/il;
    numsum_p=numsum_p/n;  %在上面将式子先列出，没有问题了
    R_s=[R_s;numsum_p];  
end
%加入最后一个 百分比 PPT上记得为 97.5
RSR2=[RSR2;min(RI)];
R_s=[R_s;0.975];
disp('最终的RSR2为：');disp(RSR2);
disp('对应的 R 的平均值为：');disp(R_s);


end

