%输入lastDAta 对数据进行归一化
numMin=min(lastData(:,1));
numMax=max(lastData(:,1));
numLeng=numMax-numMin;
beatMin=min(lastData(:,5));
beatMax=max(lastData(:,5));
beatLeng=beatMax-beatMin;
for i=1:5
    Min(i)=min(lastData(:,i));
    Leng(i)=max(lastData(:,i))-Min(i);
end

row=84;
GuiyiLastData=lastData;
for i=1:row
    for j=1:5 %归一化数据
    GuiyiLastData(i,j)=(GuiyiLastData(i,j)-Min(j))/Leng(j);
    end
end

%得到归一化后的数据，计算每类案件的危险数
lk=[0.2,0.15,0.35,0.1,0.2];
W=zeros(row,1);
for i=1:row
    for k=1:5
    W(i,1)=W(i,1)+lk(k)*GuiyiLastData(i,k);
    end
end

%综合6类求每天的安全系数
Z=zeros(14,1);
wk=[0.15,0.25,0.3,0.15,0.1,0.05];
for i=1:14
    dayfirstindex=(i-1)*6;
    for index=1:6
        leiindex=dayfirstindex+index;
        Z(i)=Z(i)+wk(index)*W(leiindex,1);
    end
end
  

Day=[1:14];Degree=Z;
%xlabel('Date');ylabel('Crime Harm Degree');


%画图，6类犯罪随时间变化图
crimeNum=zeros(6,14);
for i=1:14 %十四天
    findex=(i-1)*6;
    for crimei=1:6 %六类案件
        crimeNum(crimei,i)=lastData(findex+crimei,1);
    end
end

figure;
hold on
for i=1:6
    plot(Day,crimeNum(i,:),'.-','Color',[0.1*6 0.4+0.1*i 1/i]);
end
legend('A','B','C','D','E','F');
xlabel('Day');ylabel('Number');
hold off

%考虑时间因素的影响，加入衰变因子
deli=0.78;
%迭代求解
TimeDegree=zeros(14,1);
TimeDegree(1)=Degree(1);
for i=2:14
    TimeDegree(i)=deli*Degree(i)+(1-deli)*Degree(i-1);
end
TimeDegree=1-TimeDegree;

   
    


