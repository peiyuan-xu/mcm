%禁忌算法
clear;
clc;
%% 1 基本变量的初始化
%城市的左边
Clist=[44,5;42,10;42,15;40,5;38,5;35,5;95,30;95,35;92,30;90,35;
    88,30;87,30;85,25;85,35;67,85;65,85;65,82;62,80;60,85;42,5;
    42,12;72,35;55,20;65,35;65,20;64,42;65,55;63,65;60,12;57,29;
    63,23;67,5];
CityNum=size(Clist,1);%TSP问题的规模,即城市数目
%记录城市之间的距离
dislist=zeros(CityNum); %计算距离
for i=1:CityNum
    for j=1:CityNum
        dislist(i,j)=((Clist(i,1)-Clist(j,1))^2+(Clist(i,2)-Clist(j,2))^2)^0.5;       
    end
end
%禁忌表初始置为空
TabuList=zeros(CityNum);% 禁忌表
TabuListf=Inf*ones(CityNum);%
TabuLength=300;%禁忌长度
Candidates=CityNum*(CityNum-1)/2;%候选集的个数 (全部领域解个数)由互换操作产生
CandidateNum=zeros(Candidates,CityNum);%候选解集合
%S0=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,30,29,28,31,32;]

%初始方案
S0=[12    13    15    17    16    25    29    31    32     2     9    10    11   19    22    28     1   6     7     5     4    20    21    24    27     3     8    26    30    23  14    18 ]; 
BSF=S0; %当前的‘best so far’ 值
BestL=Inf; %当前适应函数最优值
clf; %清除当前图形
figure(1);
stop = uicontrol('style','toggle','string','stop','background','white');
tic;  %记录开始时间
p=1;
%% 2 设定算法的终止条件，进行算法终止判断
StopL=80*CityNum;%终止条件
while p<StopL %一个判断
    if Candidates>CityNum*(CityNum-1)/2
        disp('候选解个数不大于n*(n-1)/2!');
        break;
    end
    ALong(p)=Fun(dislist,S0);     %第p次迭代适应度函数值
    
    A=zeros(Candidates,4);
    k=1;
    for i=1:CityNum
        for j=i+1:CityNum
            A(k,1)=i;%方案中的次序
            A(k,2)=j;
            A(k,3)=min(S0(i),S0(j));%实际点的标号  
            A(k,4)=max(S0(i),S0(j));
            k=k+1;
        end
    end
    
     %未知 重要！！！！！！！！貌似是生成一个随机数组
    %while i<=Candidates        
     %   M=CityNum*rand(1,2);
       % M=ceil(M);
       % if M(1)~=M(2)
       %     A(i,1)=max(M(1),M(2));
        %    A(i,2)=min(M(1),M(2));
         %   if i==1
         %       isa=0;
          %  elseif TabuList(A(i,1),A(i,2)~=0)
          %      isa=1;
                
      %      else
          %      for j=1:i-1
          %          if A(i,1)==A(j,1) && A(i,2)==A(j,2) %判断是否相等
           %             isa=1;%标记出来
         %               break;
          %          else
     %                   isa=0;
      %              end
      %          end
    %        end 
    %        if ~isa
    %           i=i+1;
   %         else 
   %         end            
    %    else 
    %    end
   % end
    
    BestCandidateNum=Candidates;%保留前BestCandidateNum个最好候选解（有疑问）
    BestCandidate=Inf*ones(BestCandidateNum,4);%初始化
    F=zeros(1,Candidates);%自适应度函数值
    for i=1:Candidates
        CandidateNum(i,:)=S0;
        CandidateNum(i,[A(i,2),A(i,1)])=S0([A(i,1),A(i,2)]);
        F(i)=Fun(dislist,CandidateNum(i,:));
        BestCandidate(i,2)=F(i);
        BestCandidate(i,1)=i;
        BestCandidate(i,3)=A(i,3);
        BestCandidate(i,4)=A(i,4);  
        if TabuList(BestCandidate(i,3),BestCandidate(i,4))~=0
        
        
        
        end
    end
    %对BestCandidate 
    [JL,Index]=sort(BestCandidate(:,2)); %重排
    SBest=BestCandidate(Index,:);
    BestCandidate=SBest;
    
    if BestCandidate(1,2)<BestL
        BestL=BestCandidate(1,2);
        S0=CandidateNum(BestCandidate(1,1),:);   %所有的最优     
        BSF=S0;%最优方案
        for m=1:CityNum
            for n=1:CityNum
                if TabuList(m,n)>TabuList(BestCandidate(1,3),BestCandidate(1,4))
                    TabuList(m,n)=TabuList(m,n)-1;
                end
            end
        end
        TabuList(BestCandidate(1,3),BestCandidate(1,4))=TabuLength;
        TabuListf(BestCandidate(1,3),BestCandidate(1,4))=BestCandidate(1,2);
    else  
        for i=1:BestCandidateNum
            if  TabuList(BestCandidate(i,3),BestCandidate(i,4))==0
                S0=CandidateNum(BestCandidate(i,1),:);                
            for m=1:CityNum
                for n=1:CityNum
                    if TabuList(m,n)~=0
                        TabuList(m,n)=TabuList(m,n)-1;
                    end
                end
            end        
            TabuList(BestCandidate(i,3),BestCandidate(i,4))=TabuLength;
            TabuList(BestCandidate(i,3),BestCandidate(i,4))=BestCandidate(1,2);
            break;
            end
        end
    end    
    p=p+1;
    ArrBestL(p)=BestL;
    for i=1:CityNum-1
        plot([Clist(BSF(i),1),Clist(BSF(i+1),1)],[Clist(BSF(i),2),Clist(BSF(i+1),2)],'bo-');
        hold on;
    end
    plot([Clist(BSF(CityNum),1),Clist(BSF(1),1)],[Clist(BSF(CityNum),2),Clist(BSF(1),2)],'ro-');
    title(['Counter:',int2str(p*Candidates),'  The Min Distance:',num2str(BestL)]);
    hold off;
    pause(0.005);    
    if get(stop,'value')==1
        break;
    end
end
toc; %记录结束时间
BestShortcut=BSF;
theMinDistance=BestL;
set(stop,'style','pushbutton','string','close', 'callback','close(gcf)');
figure(2);
plot(ArrBestL,'r'); hold on;
plot(ALong,'b');grid;
title('搜索过程');
legend('Best So Far','当前解');

