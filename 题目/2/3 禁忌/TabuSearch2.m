%function [BestShortcut,theMinDistance]=TabuSearch
clear;
clc;
Clist=[0	45
5	45
2	40
0	40
8	45
8	40
10	40
5	35
8	56
10	35
2	60
20	50
15	60
12	24
6	68
10	20
4	18
21	24
20	20
15	75
18	75
15	80
15	10
18	80
20	80
5	5
20	82
20	85
23	3
];
CityNum=size(Clist,1);%TSP问题的规模,即城市数目
dislist=zeros(CityNum); %计算距离
for i=1:CityNum
    for j=1:CityNum
        dislist(i,j)=((Clist(i,1)-Clist(j,1))^2+(Clist(i,2)-Clist(j,2))^2)^0.5;       
    end
end
TabuList=zeros(CityNum);% 禁忌表？？？？？？？？？？？
TabuListf=Inf*ones(CityNum);%
TabuLength=100;%禁忌长度(tabu length)
Candidates=CityNum*(CityNum-1)/2;%候选集的个数 (全部领域解个数)
CandidateNum=zeros(Candidates,CityNum);%候选解集合
%S0=[3	4	2	1	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29];
S0=[ 15    20    21    24    25    27    28     1     4     3     8    17 16    10     2     5     7    14    19    18    12    13     9    22 6    29    11    26    23]; 
BSF=S0; %当前最优方案
BestL=Inf; %当前适应函数最优值
clf; 
figure(1);
stop = uicontrol('style','toggle','string','stop','background','white');
tic;
p=1;
StopL=80*CityNum;%未知！！！！！！！！
while p<StopL %一个判断
    if Candidates>CityNum*(CityNum-1)/2
        disp('候选解个数不大于n*(n-1)/2!');
        break;
    end
    ALong(p)=Fun2(dislist,S0);     %第p次迭代适应度函数值
    
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
        F(i)=Fun2(dislist,CandidateNum(i,:));
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
toc;
BestShortcut=BSF;
theMinDistance=BestL;
set(stop,'style','pushbutton','string','close', 'callback','close(gcf)');
figure(2);
plot(ArrBestL,'r'); hold on;
plot(ALong,'b');grid;
title('搜索过程');
legend('Best So Far','当前解');
