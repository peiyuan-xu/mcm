%数字化数据
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
        
        

