jizhi=[];
k=1;
for i=3:179
    for j=3:359
        %a=[Fitness(i-1,j+1),Fitness(i,j+1),Fitness(i+1,j+1),Fitness(i-1,j),Fitness(i+1,j),Fitness(i-1,j-1),Fitness(i,j-1),Fitness(i+1,j-1)];
        a=Fitness1(i-2:i+2,j-2:j+2);
        aa=max(a(:));%周围八个点的最大值
        if Fitness1(i,j)==aa&&Fitness1(i,j)~=0%判断是否为极大值
            jizhi(k,1)=i;%纬度信息
            jizhi(k,2)=j;%经度信息
            jizhi(k,3)=Fitness1(i,j);%极值
            k=k+1;
        end
    end
end
for k=1:length(jizhi)
jizhi(k,1)=90-jizhi(k,1)+1;%换算为纬度
jizhi(k,2)=-180+jizhi(k,2)-1;%换算为经度
end
