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
2 45];
CityNum=size(Clist,1)-1;%TSP问题的规模,即城市数目
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
S0=[16    19    12     9    15    20    22    24    27     4     3     2  5    21    25    28     1     8    23    18    10     7     6    13  29    11    26    17    14]; 
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
yuan=[17	0	45	20	9	125	2 1
14	5	45	10	6	191	3 2
15	2	40	20	9	176	5 3
16	0	40	20	5	182	5.385164807 4
12	8	45	20	6	125	6 5
11	8	40	40	10	197	7.810249676 6
10	10	40	30	10	145	9.433981132 7
13	5	35	10	10	151	10.44030651 8
76	8	56	27	9	195	12.52996409 9
9	10	35	20	9	143	12.80624847 10
71	2	60	5	9	119	15 11
51	20	50	5	10	196	18.68154169 12
58	15	60	17	8	151	19.84943324 13
85	12	24	13	10	149	23.2594067 14
77	6	68	30	10	104	23.34523506 15
57	10	20	19	10	152	26.2488095 16
95	4	18	35	8	184	27.07397274 17
84	21	24	28	6	155	28.31960452 18
72	20	20	8	8	160	30.8058436 19
7	15	75	20	5	170	32.69556545 20
6	18	75	20	6	126	34 21
8	15	80	10	5	195	37.33630941 22
56	15	10	20	8	137	37.33630941 23
45	18	80	10	5	153	38.48376281 24
4	20	80	40	9	127	39.35733731 25 
73	5	5	16	5	196	40.11234224 26
44	20	82	10	5	196	41.14608122 27
5	20	85	20	6	196	43.8634244 28
75	23	3	7	8	138	46.95742753 29
];
n=29;
for i=1:n
    for j=1:n
        if yuan(j,8)==BSF(i)
            b(i,:)=yuan(j,:);
        end
    end
end
c(1,:)=BSF;
aa=[0,BSF];
t=150;
k=0;
e=0;
for i=1:n-1
    t=t-b(i,4);
    if t==0
        k=k+1;
        d(k,:)=[i+1,b(i+1,1)];
        h=i+e; %插入的位置
        aa(1,h)=0; %插入数
        %aa(1,1:h-1)=a(1,1:h-1); %前面不变
        aa(1,h+1:n+1+e)=c(1,i:n); %后面的数后移一位
        t=150;
        e=e+1;
    end
    if t>0&&t<b(i+1,4) 
        h=i+2+e; %插入的位置
        aa(1,h)=c(1,i+1); 
        aa(1,h+1)=0;
        %aa(1,h+1)=c(1,h);
        %aa(1,1:h-1)=a(1,1:h-1); 
        aa(1,h+2:n+3+e)=c(1,i+1:n);
        k=k+1;
        e=e+2;
        d(k,:)=[i+1,b(i+1,1)];
        t=150-b(i+1,4)+t;
        p=i+1;
    end
end
if b(n,4)>t
   d(k+1,:)=[n,b(n,1)];
   aa(n+2+e)=0;
   aa(n+3+e)=BSF(32);
   aa(n+4+e)=0;
end
d(k+1,:)=[n,b(n,1)];
aa(n+2+e)=0;
for i=1:length(aa)
if aa(i)==0
    aa(i)=33;
end
end
%
    for i=1:length(aa)-1
        plot([Clist(aa(i),1),Clist(aa(i+1),1)],[Clist(aa(i),2),Clist(aa(i+1),2)],'bo-');
      
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
