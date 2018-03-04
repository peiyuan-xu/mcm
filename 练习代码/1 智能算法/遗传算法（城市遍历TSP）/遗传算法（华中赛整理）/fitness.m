function [ fitness ] = fitness( chrom )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
X_max=900;    %木板宽度
% Y_max=2350;   %木板高度
Y_max=3000;
R=[350,300
    350,200
    500,240
    500,210
    500,350
    250,300
    250,200
    500,400
    500,200];
initial_R=[R;R];
%求零件总面积
n=size(initial_R,1);
Areas=0;
for numbers=1:n
    Areas=Areas+initial_R(numbers,1)*initial_R(numbers,2);
end

[num,length]=size(chrom);
fitness=zeros(num,1);

for number=1:num
    R=zeros(n,2);
    for l=1:length
        R(l,:)=initial_R(chrom(number,l),:);
    end
%     disp(num2str(R));
    
    N=size(R,1);  %零件个数
    X=X_max;      %初始最低水平线的宽度
    Y=0;          %初始最低水平线的高度
    i=1;          %当前填补的零件号
    count=0;     %填补零件成功的个数
    minHorizon=find_MinHorizon(Y);  %最低水平线位置
    %% 不断循环操作
    while(1)
        if( X(minHorizon)-R(i,2) < X(minHorizon)-R(i,1) )...
                ||(X(minHorizon)-R(i,2)>0&&X(minHorizon)-R(i,1)<0)
            t=R(i,1);R(i,1)=R(i,2);R(i,2)=t;
        end

% disp(['minHorizon=',num2str(minHorizon)]);
% disp(['i=',num2str(i),' count=',num2str(count)]);
% % y_l=Y_max-Y(minHorizon);
% disp(['X=',num2str(X),' Y=',num2str(Y)]);
% disp(['R(i,1)=',num2str(R(i,1)),' R(i,2)=',num2str(R(i,2))]);
% disp('------------------------------------');
        if((Y_max-Y(minHorizon))<R(i,2))
            fitness(number,1)=0;
%             disp('长度不够');
            break;
        end
        %% 当最低水平线能填补当前零件时
        if (R(i,1)<X(minHorizon)) && (R(i,2)<=Y_max-Y(minHorizon))
            if minHorizon>1
                xFirst=X(1:minHorizon-1);
                yFirst=Y(1:minHorizon-1);
            else
                xFirst=[];
                yFirst=[];
            end
            if minHorizon<numel(X)
                xLast=X(minHorizon+1:numel(X));
                yLast=Y(minHorizon+1:numel(Y));
            else
                xLast=[];
                yLast=[];
            end
            X=[xFirst,R(i,1),X(minHorizon)-R(i,1),xLast];
            Y=[yFirst,Y(minHorizon)+R(i,2),Y(minHorizon),yLast];
            
            minHorizon=find_MinHorizon(Y);
            count=count+1;
            i=i+1;
            
            %% 当最低水平线宽度刚好适合填补当前零件时
        elseif (X(minHorizon)==R(i,1)&& (Y_max-Y(minHorizon))>=R(i,2))
            if minHorizon>1
                yFirst=Y(1:minHorizon-1);
            else
                yFirst=[];
            end
            if minHorizon<numel(X)
                yLast=Y(minHorizon+1:numel(Y));
            else
                yLast=[];
            end
            Y=[yFirst,Y(minHorizon)+R(i,2),yLast];
            
            minHorizon=find_MinHorizon(Y);
            count=count+1;
            i=i+1;
            
            %% 当当前零件放不进去最低水平线时，提高最低水平线
        else
            if i<N
                %试后面的零件能否在当前水平线上放下
                for j=(i+1):N
                    flag=judege_feasibility( R(j,:),X,Y,minHorizon );
                    if(flag==1)
                        r=R(i,:);
                        R(i,:)=R(j,:);
                        R(j,:)=r;
                        break;
                    end
                end
            end
            if i==N
                flag=0;
            end
            %% 若后面也没有合适的，开始更新水平线
            if flag==0
                [X,Y,minHorizon]=change_Horizon(X,Y,minHorizon);
            end
        end
        if(count==N)
            fitness(number,1)=Areas/(X_max*max(Y));
%             disp(['成功拼接，Rate=',num2str(fitness(number,1))]);
%             disp(['Areas=',num2str(Areas),' X_max=',num2str(X_max)]);
%             disp(['max(Y)=',num2str(max(Y))]);
            break;
        end
    end
end
end

