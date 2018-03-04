function dayLSum= DayLength( tcity,tplay,chrom )
%计算当前路线下的所用天数，记录了每条路线的天数，和每天最后一处旅游景点
[num,chromL]=size(chrom);

dayLSum=zeros(num,1); %所占天数,到省会时先呆一天，所以初始化为 1
luxianIndex=zeros(num,chromL);%记录每一天 到的最后一个景点


for i=1:num %每次处理 1 条路线
    timeNow=7;%当前时间，范围 7:00 -- 19:00
    dayLength=1; %所占天数,到省会时先呆一天，所以初始化为 1
    timeDrive=0; %行车时间
    chromI=[chrom(i,:),chrom(i,1)];
    nextFlag=0;  % 0 表示继续处理当前路线
    numhavecity=1;
    flaggo=1;%去下一个城市
    luxianIndex(i,1)=1;
    %遍历路线中的城市
   
    while nextFlag==0
        pstart=chromI(numhavecity);pend=chromI(numhavecity+1);
      %% 约束条件 
       % 1 行车时间约束
     
     newtimeDrive=timeDrive+tcity(pstart,pend);
     newtimeNow=timeNow+timeDrive+tplay(pend);
     newtimeNowDrive=timeNow+tcity(pstart,pend);  %行车时间不能》19:00
     if newtimeDrive>8 || newtimeNow>18 || newtimeNowDrive>19
         
         flaggo=0;
     end

     if flaggo==1 %加入新的城市
         numhavecity=numhavecity+1;
         timeDrive=timeDrive+tcity(pstart,pend);
         timeNow=timeNow+timeDrive+tplay(pend);
         timeNowDrive=timeNow+tcity(pstart,pend);  %行车时间不能》19:00
         %numhavecity=numhavecity+1;
     else %开始新的一天
         %一天开车时间》8时，不再旅游
         indexLX=find(luxianIndex(i,:)==0);
         if  ~isempty(indexLX)
         indexLX=indexLX(1);
         else
             break;
         end
         luxianIndex(i,indexLX)=pstart; %记录这天最后一个旅游景点

         dayLength=dayLength+1;
         timeDrive=0;  %天数加 1 ，新的一天
         timeNow=7;
     end
     flaggo=1; %最后要 flaggo=1 以对后续城市访问
     if numhavecity==(chromL+1)   %回到省会原点
         nextFlag=1;
     end
    end
dayLSum(i,1)=dayLength;

end
end

