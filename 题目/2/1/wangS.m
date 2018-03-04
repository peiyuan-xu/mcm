clear 
clc 
% A 为公司配送中心与医院客户点，医院客户点相互之间的距离矩阵 
A=[0 13.1 18.4 17.4  10.1 12.5 8.5 12.8 17 20.1 18.4 15.3 20 17.7 11.8; 
13.1 0 6.1 9 6.7 1.4 5.4 1.7 3.8 4.5 2.9 2 8.6 6.2 2.4; 
18.4 6.1 0 7.7 11.7 8.6 12.1 5.4 3 2.4 3.3 4.6 8.3 6.3 7.3; 
17.4 9 7.7 0 13.8 7 13.3 6.2 7.2 7.1 7.9 9 13.8 12 5.7; 
10.1 6.7 11.7 13.8 0 5.9 5.3 6.7 10 10.6 9 7.3 10.8 8.3 7.5; 
12.5 1.4 8.6 7 5.9 0 4.1 0.9 4.9 5.6 4 2.8 8.7 6.9 1.6; 
8.5 5.4 12.1 13.3 5.3 4.1 0 4.4 9.6 10.8 8.2 6.5 11.6 8.6 4.2; 
12.8 1.7 5.4 6.2 6.7 0.9 4.4 0 5 5.8 4.3 3 9.2 6 1.9; 
17 3.8 3 7.2 10 4.9 9.6 5 0 1.3 1 2.7 6.9 5.6 5; 
20.1 4.5 2.4 7.1 10.6 5.6 10.8 5.8 1.3 0 1.9 3.7 8 6.9 5.9; 
18.4 2.9 3.3 7.9 9 4 8.2 4.3 1 1.9 0 1.8 6.8 5 4.5; 
15.3 2 4.6 9 7.3 2.8 6.5 3 2.7 3.7 1.8 0 6.3 4.3 3.6; 
20 8.6 8.3 13.8 10.8 8.7 11.6 9.2 6.9 8 6.8 6.3 0 5.9 9.8; 
17.7 6.2 6.3 12 8.3 6.9 8.6 6 5.6 6.9 5 4.3 5.9 0 7.9; 
11.8 2.4 7.3 5.7 7.5 1.6 4.2 1.9 5 5.9 4.5 3.6 9.8 7.9 0]; 
%T 矩阵为配送中心，客户医院之间的运送时间矩阵 
T=[0.00 0.47 0.66 0.62 0.36 0.45 0.30 0.46 0.61 0.72 0.66 0.55 0.71 0.63 0.42;
   0.47 0.00 0.22 0.32 0.24 0.05 0.19 0.06 0.14 0.16 0.10 0.07 0.31 0.22 0.09;
   0.66 0.22 0.00 0.28 0.42 0.3 0.43 0.19 0.11 0.09 0.12 0.16 0.30 0.23 0.26;
   0.62 0.32 0.28 0.00 0.49 0.25 0.48 0.22 0.26 0.25 0.28 0.32 0.49 0.43 0.20;
0.36 0.24 0.42 0.49 0.00 0.21 0.19 0.24 0.36 0.38 0.32 0.26 0.39 0.30 0.27; 
0.45 0.05 0.31 0.25 0.21 0.00 0.15 0.03 0.18 0.20 0.14 0.10 0.31 0.25 0.06; 
0.30 0.19 0.43 0.48 0.19 0.15 0.00 0.16 0.34 0.39 0.29 0.23 0.41 0.31 0.15; 
0.46 0.06 0.19 0.22 0.24 0.03 0.16 0.00 0.18 0.21 0.15 0.11 0.33 0.21 0.07; 
0.61 0.14 0.11 0.26 0.36 0.18 0.34 0.18 0.00 0.05 0.04 0.10 0.25 0.20 0.18;
0.72 0.16 0.09 0.25 0.38 0.20 0.39 0.21 0.05 0.00 0.07 0.13 0.29 0.25 0.21;
0.66 0.10 0.12 0.28 0.32 0.14 0.29 0.15 0.04 0.07 0.00 0.06 0.24 0.18 0.16;
0.55 0.07 0.16 0.32 0.26 0.10 0.23 0.11 0.10 0.13 0.06 0.00 0.23 0.15 0.13;
0.71 0.31 0.30 0.49 0.39 0.31 0.41 0.33 0.25 0.29 0.24 0.23 0.00 0.21 0.35; 
0.63 0.22 0.23 0.43 0.30 0.25 0.31 0.21 0.20 0.25 0.18 0.15 0.21 0.00 0.28; 
0.42 0.09 0.26 0.20 0.27 0.06 0.15 0.07 0.18 0.21 0.16 0.13 0.35 0.28 0.00;]; 
UT=[0 0.40 0.38 0.35 0.50 0.35 0.40 0.45 0.40 0.35 0.30 0.50 0.50 0.55 0.60];%卸货时间矩阵 
ET=[0 0.40 0.20 0.60 0.20 0.30 0.10 0.45 0.60 0.50 0.40 0.30 0.50 0.40 0.20];%最早到达时间矩阵 
LT=[0 1.50 1.50 3.00 1.00 2.50 5.00 8.00 4.00 8.00 5.00 5.00 6.00 2.50 1.50];%最晚到达时间矩阵 
B=[0 10 8 5 12 7 9 11 10 7 4 9 6 12 8];% B为各客户的药品需求箱数的矩阵 
CarContent=27; % 车辆的运货容量限制 
p=zeros(15,15); % 用于存储节约里程矩阵 
m=15; % 配货中心和客户中心的总数 
% 求节约里程矩阵 
for i=2:(m-1) 
    for j=(i+1):m         
        p(i,j)=A(1,i)+A(1,j)-A(i,j); 
    end 
end 
% 对节约里程矩阵进行排序 
s=p(:); 
[px,wz]=sort(s,1,'descend'); 

% 从节约里程矩阵中找到最大值，作为首选线路 
for i=1:(m^2)    
    [x,y]=ind2sub(size(p),wz(i)); 
    
    if B(1,x)+B(1,y)<=CarContent 
        %下面的代码主要是检查是否满足时间约束条件 
        if T(1,x)>LT(1,x) 
            continue 
        elseif ET(1,x)<=T(1,x)<=LT(1,x) 
            Time(1)=T(1,x)+UT(1,x); 
        elseif T(1,x)<ET(1,x)  
            Time(1)=ET(1,x)+UT(1,x); 
        else 
            continue 
        end 
        if Time(1)+T(x,y)>LT(1,y) 
            continue 
        elseif ET(1,y)<=Time(1)+T(x,y)<=LT(1,y) 
            t=Time(1)+T(x,y)+UT(1,y); 
            Time(1)=[]; 
            Time(1)=t; 
        elseif Time(1)+T(x,y)<ET(1,y) 
            t=Time(1)+T(x,y)+UT(1,y); 
            Time(1)=[]; 
            Time(1)=ET(1,y)+UT(1,y); 
        else 
            continue 
        end 
        solut=[x,y]; 
        n(1)=2; 
        volume(1)=B(1,x)+B(1,y); 
        ii=i; 
        break; 
    else 
        continue 
    end 
end 
 
 %循环查找所有线路，solut 为最终的线路矩阵，矩阵的一行表示一条线路 
for mm=(ii+1):(m^2)                
[x,y]=ind2sub(size(p),wz(mm)); 
     if px(mm)==0 
         break 
     end 
     [xa,ya]=find(x==solut); 
     [xb,yb]=find(y==solut); 
     [sa,sb]=size(solut); 
     if isempty(xa)==1 &&isempty(xb)==1   %x y 两客户都不在已构造的配送线路上 
         if x==y    
             continue 
         elseif B(1,x)+B(1,y)<=CarContent 
              [qa,qb]=size(solut); 
             if T(1,x)>LT(1,x) 
                 continue 
             elseif ET(1,x)<=T(1,x) && T(1,x)<=LT(1,x)  
                 Time(qa+1)=T(1,x)+UT(1,x); 
             elseif T(1,x)<ET(1,x) 
                 Time(qa+1)=ET(1,x)+UT(1,x); 
             else 
                 continue 
             end 
             if Time(qa+1)+T(x,y)>LT(1,y) 
                 continue 
             elseif ET(1,y)<=Time(qa+1)+T(x,y) && Time(qa+1)+T(x,y)<=LT(1,y) 
                 temp=Time(qa+1)+T(x,y)+UT(1,y); 
                 Time(qa+1)=[]; 
                 Time(qa+1)=temp; 
             elseif Time(qa+1)+T(x,y)<ET(1,y) 
                 temp=ET(1,y)+UT(1,y); 
                 Time(qa+1)=[]; 
                 Time(qa+1)=temp; 
             else 
                 continue 
             end 
             newroad=[x,y]; 
             solut((qa+1),1:length(newroad))=newroad; 
             volume(sa+1)=B(1,x)+B(1,y); 
             n(qa+1)=length(newroad); 
         else 
             continue 
         end 
     elseif isempty(xa)==0 && isempty(xb)==1  % x 客户在已构造的路线上，y 客户不在 
            if ya==1 % x 客户在路线的起点上 
                if volume(xa)+B(1,y)<=CarContent 
                    newroad=[y solut(xa,1:n(xa))]; 
                    [time,TorF]=Timesum(T(1,y),ET(1,y),LT(1,y),UT(1,y)); 
                    if TorF~='F' 
                        Time(xa)=time; 
                        for ii=2:length(newroad) 
                            [time,TorF]=Timesum(Time(xa)+T(newroad(ii-1),newroad(ii)),ET(1,newroad(ii)),LT(1,newroad(ii)),UT(1,newroad(ii))); 
                            if TorF~='F' 
                            Time(xa)=time; 
                            else 
                                break 
                            end 
                        end 
                    else 
                        continue 
                    end     
                    if ii==length(newroad) 
                    solut(xa,:)=[]; 
                    n(xa)=[]; 
                    [qa,qb]=size(solut); 
                    solut((qa+1),1:length(newroad))=newroad; 
                    vol=volume(xa)+B(1,y); 
                    volume(xa)=[]; 
                    volume(qa+1)=vol; 
                    tmp=Time(xa); 
                    Time(xa)=[]; 
                    Time(qa+1)=tmp; 
                    n(qa+1)=length(newroad); 
                    else 
                        continue 
                    end 
                         
                else 
                    continue 
                end 
            elseif ya==n(xa) % x 客户在路线的终点上 
                    if volume(xa)+B(1,y)<=CarContent    
                    newroad=[solut(xa,1:n(xa)) y]; 
                    [time,TorF]=Timesum(Time(xa)+T(newroad(ii),y),ET(1,y),LT(1,y),UT(1,y)); 
                    if TorF~='F' 
                        Time(xa)=time; 
                    else 
                        continue 
                    end 
                    solut(xa,:)=[]; 
                    n(xa)=[]; 
                    [qa,qb]=size(solut); 
                   solut((qa+1),1:length(newroad))=newroad; 
                    vol=volume(xa)+B(1,y); 
                    volume(xa)=[]; 
                    volume(qa+1)=vol; 
                    tmp=Time(xa); 
                    Time(xa)=[]; 
                    Time(qa+1)=tmp; 
                    n(qa+1)=length(newroad); 
                    else 
                        continue 
                    end 
           else 
                    continue 
            end  
 
     elseif isempty(xa)==1 && isempty(xb)==0  %xb  0 y 客户在已构造的路线上，x 客户不在 
         if yb==1 % y 客户在路线的起点上 
                if volume(xb)+B(1,x)<=CarContent 
                    newroad=[x solut(xb,1:n(xb))]; 
                    [time,TorF]=Timesum(T(1,x),ET(1,x),LT(1,x),UT(1,x)); 
                    if TorF~='F' 
                        Time(xb)=time; 
                        for ii=2:length(newroad) 
                            [time,TorF]=Timesum(Time(xb)+T(newroad(ii-1),newroad(ii)),ET(1,newroad(ii)),LT(1,newroad(ii)),UT(1,newroad(ii))); 
                            if TorF~='F' 
                            Time(xb)=time; 
                            else 
                                break 
                            end 
                        end 
                    else 
                        continue 
                    end 
                    if ii==length(newroad) 
                    solut(xb,:)=[]; 
                    n(xb)=[]; 
                    [qa,qb]=size(solut); 
                    solut((qa+1),1:length(newroad))=newroad; 
                    vol=volume(xb)+B(1,x); 
                    volume(xb)=vol; 
                    tmp=Time(xb); 
                    Time(xb)=[]; 
                    Time(qa+1)=tmp; 
                    n(qa+1)=length(newroad); 
                    else 
                        continue 
                    end 
                else 
                    continue 
                end 
          elseif yb==n(xb) % y 客户在线路的终点上 
                    if volume(xb)+B(1,x)<=CarContent 
                    newroad=[solut(xb,1:n(xb)) x]; 
                    
                    %根据 CT 的值确定，time应该是从i 到 j min（2个距离）
                    [time,TorF]=Timesum(Time(xb)+T(newroad(length(newroad)-1),x),ET(1,x),LT(1,x),UT(1,x)); 
                    if TorF~='F'  %当CTj<0 或 > 0 TorF 在上部中根据提前量和延迟量确定
                        Time(xb)=time; 
                    else 
                        continue 
                    end 
                    solut(xb,:)=[]; 
                    n(xb)=[]; 
                    [qa,qb]=size(solut); 
                    solut((qa+1),1:length(newroad))=newroad; 
                    vol=volume(xb)+B(1,x); 
                    volume(xb)=[]; 
                    volume(qa+1)=vol; 
                    tmp=Time(xb); 
                    Time(xb)=[]; 
                    Time(qa+1)=tmp; 
                    n(qa+1)=length(newroad); 
                    else 
                        continue 
                    end 
         else 
                 continue 
         end 
            
         elseif isempty(xa)==0 && isempty(xb)==0  %x y都在已构建的路线上 吉林大学硕士学位论文 
         if xa==xb   % x y 在同一个已构造的线路上 则不再判断 
               continue 
           elseif xa~=xb % x y 不在同一个已构造的线路上，则再判断 
               if volume(xa)+volume(xb)<=CarContent 
                   if ya==1 && yb==n(xb)  %x 是已构造线路的起点，y是另一条已构造线路的终点 
                       newroad=[solut(xb,1:n(xb)) solut(xa,1:n(xa))]; 
                       [time,TorF]=Timesum(T(1,newroad(1)),ET(1,newroad(1)),LT(1,newroad(1)),UT(1,newroad(1))); 
                    if TorF~='F' 
                        Time(xb)=time; 
                        for ii=2:length(newroad) 
                            [time,TorF]=Timesum(Time(xb)+T(newroad(ii-1),newroad(ii)),ET(1,newroad(ii)),LT(1,newroad(ii)),UT(1,newroad(ii))); 
                            if TorF~='F' 
                            Time(xb)=time; 
                            else 
                                break 
                            end 
                        end 
                    else 
                        continue 
                    end 
                    if ii==length(newroad) 
                       solut(xa,:)=[]; 
                       solut(xb,:)=[]; 
                       n(xa)=[]; 
                       n(xb)=[]; 
                       [qa,qb]=size(solut); 
                       solut((qa+1),1:length(newroad))=newroad; 
                       vol=volume(xa)+volume(xb); 
                       volume(xa)=[]; 
                       volume(xb)=[]; 
                       volume(qa+1)=vol; 
                       tmp=Time(xa)+Time(xb); 
                       Time(xa)=[]; 
                       Time(xb)=[]; 
                       Time(qa+1)=tmp; 
                       n(qa+1)=length(newroad); 
                    else 
                        continue 
                    end 
                   elseif ya==n(xa) && yb==1   %y 是已构造线路的起点，x是另一条已构造线路的终点 
                       newroad=[solut(xa,1:n(xa)) solut(xb,1:n(xb))]; 
                       [time,TorF]=Timesum(T(1,newroad(1)),ET(1,newroad(1)),LT(1,newroad(1)),UT(1,newroad(1))); 
                    if TorF~='F' 
                        Time(xa)=time; 
                        for ii=2:length(newroad) 
                            [time,TorF]=Timesum(Time(xa)+T(newroad(ii-1),newroad(ii)),ET(1,newroad(ii)),LT(1,newroad(ii)),UT(1,newroad(ii))); 
                            if TorF~='F' 
                            Time(xa)=time; 
                            else 
                                break 
                            end 
                        end 
                    else 
                        continue 
                    end 
                    if ii==length(newroad) 
                       solut(xa,:)=[]; 
                       solut(xb,:)=[]; 
                       n(xa)=[]; 
                       n(xb)=[]; 
                      [qa,qb]=size(solut); 
                       solut((qa+1),1:length(newroad))=newroad; 
                       vol=volume(xa)+volume(xb); 
                       volume(xa)=[]; 
                       volume(xb)=[]; 
                       volume(qa+1)=vol; 
                       tmp=Time(xa)+Time(xb); 
                       Time(xa)=[]; 
                       Time(xb)=[]; 
                       Time(qa+1)=tmp; 
                       n(qa+1)=length(newroad); 
                    else 
                        continue 
                    end 
                   
else                             
 % 其他的 x y 都是在已构造的线路的中间，不能将其连入一条线路 
                       continue 
                   end 
               else 
                   continue 
               end 
           else 
               continue 
           end 
     else 
         continue 
     end              
end     
 
totalvol=sum(volume(:));%总运货容量 
 
%为了易于理解的需要，修改一下线路的各客户的代号 
solut=solut-1; 
[qa,qz]=size(solut); 
for ii=1:qa 
    for jj=1:qz 
       if solut(ii,jj)==-1 
               solut(ii,jj)=0; 
       end 
    end 
end 