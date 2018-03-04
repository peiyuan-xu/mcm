%%
clc,clear
%% 1 读入
I=imread('test.bmp');
I=rgb2gray(I);
[m,n]=size(I);
%% 2 横向平滑处理
step=200;
k=1.5;
G=zeros(m,n);
for i=1:m   
    for j=1:n
        if j<n-step
            %向后
            s1=sum(I(i,j:j+step))/(step+1);
        else
            %向前
            s1=sum(I(i,j-step:j))/(step+1);
        end
            
        G(i,j)=s1*k;
    end
end
%% 3 纵向拉伸.拉伸因子k
Gs=sum(sum(G))/(m*n);
G1=zeros(m,n);
k=3;
step=2;  %与下面求宽度的L-1对应（L-step+1）
for i=1:m
    for j=1:n
        if i<m-step
            %向后比较
            temph=G(i,j)-G(i:i+step,j);
            s=max(temph);
            if s<0
                s=0;
            end
            G1(i,j)=s*k;
        else
            %向前比较
            temph=G(i,j)-G(i-step:i,j);
            s=max(temph);
             if s<0
                s=0;
            end
            G1(i,j)=s*k;
        end
    end
end
%% 4 灰度图（阈值处理）显示
G1=uint8(G1);
level=graythresh(G1);     %确定灰度阈值
I3=im2bw(G1,level); 
I3=~I3;

%% 5 求宽度
TouYing =zeros(m,1);
for i=1:m
    TouYing(i,1) = sum(I3(i,:));
end
indexs=find(TouYing<(sum(TouYing)/(m*2)));
L=length(indexs);
sumL=0;
count=0;
for i=1:L-1
    if indexs(i+1)-indexs(i)>10
        count=count+1;
        sumL=sumL+indexs(i+1)-indexs(i);
    end
end
sumL=sumL/count;
disp(['每行平均占总纸张长度的(比例):',num2str(sumL/m)]);
%% 5 画图
figure,imshow(I);title('原图像');
G=uint8(G);
figure,imshow(G);title('横向平滑');
figure,imshow(I3);title('纵向拉伸（结果）');
