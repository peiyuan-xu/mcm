%% 1 预处理数据

[m,n]=size(MyCityCrimeData);
%统计犯罪类型
ptype=tabulate(MyCityCrimeData(:,2));
%提取频数>3%的犯罪案例
sumtype=1;
for i=1:27
    if(a(i)>=3)
       index=i;
       typeEnd(sumtype,:)=ptype(index,:);
       sumtype=sumtype+1;
    end
end
%数据的筛选、提取
sumNum=1;
[m,n]=size(MyCityCrimeData);
for i=1:m
    oldData=MyCityCrimeData{i,2};
    for j=1:10
        celltype=typeEnd{j,1};
        if(isequal(oldData,celltype))
          newCrimeData(sumNum,:)=MyCityCrimeData(i,:);
          sumNum=sumNum+1;
          break;
        end
    end
end

%画图，6类犯罪案件的频率统计
p=[28.2656 10.562 9.792 5.0707 27.2353 10.3207];
p=p/100;
x=[1:6];
bar(x,p);
xlabel('CASE TYPE');ylabel('Frequency');
%统计数据集的案发地点的频率分布
location=tabulate(newCrimeData(:,4));
[m,n]=size(location);
suml=1;
%提取频率>2%的地点，以便下一步映射为数字
for i=1:m
    ploca=cell2mat(location(i,3));
    if ploca>2
        largeLoca(suml,:)=location(i,:);
        suml=suml+1;
    end
end

%% 2 数字化数据
type={'BATTERY','ASSAULT','ROBBERY','NARCOTICS','CRIMINAL DAMAGE','BURGLARY','THEFT','MOTOR VEHICLE THEFT' ,'OTHER OFFENSE','DECEPTIVE PRACTICE'};
loca={'PARKING LOT/GARAGE(NON.RESID.)','APARTMENT','STREET','OTHER','SIDEWALK','RESIDENCE PORCH/HALLWAY','ALLEY','RESIDENCE','SMALL RETAIL STORE','VEHICLE NON-COMMERCIAL','RESIDENTIAL YARD (FRONT/BACK)'};
[m,n]=size(newCrimeData);
NumCrimeData=newCrimeData;
index=0;
for i=1:m
    typeone=NumCrimeData{i,2};
    locaone=NumCrimeData{i,4};
    isarrest=NumCrimeData{i,5};
    isDome=NumCrimeData{i,6};
    
    %%替换类型
    for k=1:10
        if isequal(typeone,type{1,k})
            index=k;
            break;
        end
    end
    if 1<=index && index<4
        NumCrimeData{i,2}='A';
    elseif index==4
        NumCrimeData{i,2}='B';
    elseif index==5
        NumCrimeData{i,2}='C';
    elseif index==6
        NumCrimeData{i,2}='D';
    elseif 6<index && index<9
        NumCrimeData{i,2}='E';
    else
        NumCrimeData{i,2}='F';
    end
    %%地点替换
    for k=1:11
        if isequal(locaone,loca{1,k})
            index=k;
            break;
        end
    end
    switch index
        case 1
            NumCrimeData{i,4}=0.5;
        case 2
            NumCrimeData{i,4}=0.6;
        case 3
            NumCrimeData{i,4}=0.9;
        case 4
            NumCrimeData{i,4}=0.7;
        case 5
            NumCrimeData{i,4}=0.9;
        case 6
            NumCrimeData{i,4}=0.6;
        case 7
            NumCrimeData{i,4}=0.9;
        case 8 
            NumCrimeData{i,4}=0.6;
        case 9
            NumCrimeData{i,4}=0.8;
        case 11
            NumCrimeData{i,4}=0.5;
        otherwise
            NumCrimeData{i,4}=0.6;
    end
            
    
    %替换逮捕
    if isarrest=='Y'
        NumCrimeData{i,5}=1;
    else
        NumCrimeData{i,5}=0;
    end
    %替换国内
    if isDome=='Y'
        NumCrimeData{i,6}=1;
    else
        NumCrimeData{i,6}=0;
    end
    
end

%% 3 案件的分类后的数据统计记录
%找日期
dataF=[0,117,973,1793,2536,3309,4057,4906,5650,6423,7169,7901,8659,9397,10185];
for d=1:14  %每次1天 
 lastDataIndex=(d-1)*6+1;
 %记录总数
 num=zeros(1,6);
 %记录地点值
 loca=zeros(1,6);
 %记录逮捕个数
 arrest=zeros(1,6);
 %记录国内率
 dem=zeros(1,6);
 %记录beat
 beat=zeros(1,6);
 
 first=dataF(d)+1;
 last=dataF(d+1);
for i=first:last
     %每次一个案例
     typeone=NumCrimeData{i,2};
     switch typeone
         case 'A'
             num(1)=num(1)+1;
             loca(1)=loca(1)+NumCrimeData{i,3};
             arrest(1)=arrest(1)+NumCrimeData{i,4};
             dem(1)=dem(1)+NumCrimeData{i,5};
             beat(1)=beat(1)+NumCrimeData{i,6};
         case 'B'
             num(2)=num(2)+1;
             loca(2)=loca(2)+NumCrimeData{i,3};
             arrest(2)=arrest(2)+NumCrimeData{i,4};
             dem(2)=dem(2)+NumCrimeData{i,5};
             beat(2)=beat(2)+NumCrimeData{i,6};
         case 'C'
             num(3)=num(3)+1;
             loca(3)=loca(3)+NumCrimeData{i,3};
             arrest(3)=arrest(3)+NumCrimeData{i,4};
             dem(3)=dem(3)+NumCrimeData{i,5};
             beat(3)=beat(3)+NumCrimeData{i,6};
         case 'D'
             num(4)=num(4)+1;
             loca(4)=loca(4)+NumCrimeData{i,3};
             arrest(4)=arrest(4)+NumCrimeData{i,4};
             dem(4)=dem(4)+NumCrimeData{i,5};
             beat(4)=beat(4)+NumCrimeData{i,6};
         case 'E'
             num(5)=num(5)+1;
             loca(5)=loca(5)+NumCrimeData{i,3};
             arrest(5)=arrest(5)+NumCrimeData{i,4};
             dem(5)=dem(5)+NumCrimeData{i,5};
             beat(5)=beat(5)+NumCrimeData{i,6};
         otherwise
             num(6)=num(6)+1;
             loca(6)=loca(6)+NumCrimeData{i,3};
             arrest(6)=arrest(6)+NumCrimeData{i,4};
             dem(6)=dem(6)+NumCrimeData{i,5};
             beat(6)=beat(6)+NumCrimeData{i,6};
     end
    
    
    
end
for sixi=1:6
lastData(sixi+lastDataIndex-1,:)=[num(sixi),loca(sixi)/num(sixi),arrest(sixi)/num(sixi),dem(sixi)/num(sixi),beat(sixi)/num(sixi)];
end

end










