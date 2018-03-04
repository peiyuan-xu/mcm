%function [BestShortcut,theMinDistance]=TabuSearch
clear;
clc;
Clist=[44,5;42,10;42,15;40,5;38,5;35,5;95,30;95,35;92,30;90,35;
    88,30;87,30;85,25;85,35;67,85;65,85;65,82;62,80;60,85;42,5;
    42,12;72,35;55,20;65,35;65,20;64,42;65,55;63,65;60,12;57,29;
    63,23;67,5];
CityNum=size(Clist,1);%TSP问题的规模,即城市数目
dislist=zeros(CityNum); %计算距离
for i=1:CityNum
    for j=1:CityNum
        dislist(i,j)=((Clist(i,1)-Clist(j,1))^2+(Clist(i,2)-Clist(j,2))^2)^0.5;       
    end
end
TabuList=zeros(CityNum);% 禁忌表？？？？？？？？？？？
TabuLength=round((CityNum*(CityNum-1)/2)^0.5);%禁忌长度(tabu length)
Candidates=200;%候选集的个数 (全部领域解个数)
CandidateNum=zeros(Candidates,CityNum);%候选解集合
%S0=randperm(CityNum);%随机产生初始解
S0=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,30,29,28,31,32;]
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
    ALong(p)=Fun(dislist,S0);     %第p次迭代适应度函数值
    
    i=1;
    A=zeros(Candidates,2);%未知 重要！！！！！！！！貌似是生成一个随机数组
    while i<=Candidates        
        M=CityNum*rand(1,2);
        M=ceil(M);
        if M(1)~=M(2)
            A(i,1)=max(M(1),M(2));
            A(i,2)=min(M(1),M(2));
            if i==1
                isa=0;
            elseif TabuList(A(i,1),A(i,2)~=0)
                isa=1;
                
            else
                for j=1:i-1
                    if A(i,1)==A(j,1) && A(i,2)==A(j,2) %判断是否相等
                        isa=1;%标记出来
                        break;
                    else
                        isa=0;
                    end
                end
            end 
            if ~isa
               i=i+1;
            else 
            end            
        else 
        end
    end
    
    BestCandidateNum=100;%保留前BestCandidateNum个最好候选解（有疑问）
    BestCandidate=Inf*ones(BestCandidateNum,4);%初始化
    F=zeros(1,Candidates);%自适应度函数值
    for i=1:Candidates
        CandidateNum(i,:)=S0;
        CandidateNum(i,[A(i,2),A(i,1)])=S0([A(i,1),A(i,2)]);
        F(i)=Fun(dislist,CandidateNum(i,:));
        if i<=BestCandidateNum
            BestCandidate(i,2)=F(i);
            BestCandidate(i,1)=i;
            BestCandidate(i,3)=S0(A(i,1));
            BestCandidate(i,4)=S0(A(i,2));   
        else
            for j=1:BestCandidateNum
                if F(i)<BestCandidate(j,2)
                    BestCandidate(j,2)=F(i);
                    BestCandidate(j,1)=i;
                    BestCandidate(j,3)=S0(A(i,1));
                    BestCandidate(j,4)=S0(A(i,2));
                    break;
                end            
            end
        end
    end
    %对BestCandidate 
    [JL,Index]=sort(BestCandidate(:,2)); 
    SBest=BestCandidate(Index,:);
    BestCandidate=SBest;
    
      if BestCandidate(1,2)<BestL
        BestL=BestCandidate(1,2);
        S0=CandidateNum(BestCandidate(1,1),:);        
        BSF=S0;
        for m=1:CityNum
            for n=1:CityNum
                if TabuList(m,n)~=0
                    TabuList(m,n)=TabuList(m,n)-1;
                end
            end
        end
        TabuList(BestCandidate(1,3),BestCandidate(1,4))=TabuLength;
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

