%% 横向中值滤波
clc,clear

%% 1 读入
I=imread('test.bmp');
I=rgb2gray(I);



%% 水平均值
[m,n]=size(I);
Y = zeros(m,n);
step = 7;
for i=1:m
    for j=1:n-step
        temp = I(i,j:j+step);
        s = sum(temp);
        h =s/step;
        Y(i,j)=h;
    end
end
for i=1:m
    for j =n-step+1:n
        Y(i,j)=I(i,j);
    end
end
Y=uint8(Y);

%% 水平滤波2
K1=filter2(fspecial('average',3),I)/255;

%进行3*3均值滤波

K2=filter2(fspecial('average',5),I)/255;

%进行5*5均值滤波

K3=filter2(fspecial('average',7),I)/255;
%% 3全局均值
G=zeros(m,n);
for i=1:m   %横向处理平滑
    s2 = sum(I(i,:));
    s2 =s2/n;
    for j=1:n
        G(i,j)=s2;
    end
end
%纵向拉伸.拉伸因子
a=0.3;
for i=1:n
    s2=sum(I(:,i));
    s2=s2/m;
    for j=1:m
        if I(j,i)>s2
     %       G(j,i) = (1+a)*I(j,i);
        else
       %     G(j,i) = (1-a)*I(j,i);
        end
    end
    
end
G=uint8(G);

s=sum(sum(Y));
s=s/(m*n);

%% 2 使用阈值
I2=im2bw(Y,s/255);  
level=graythresh(Y);     %确定灰度阈值
I3=im2bw(Y,level);   
%% 显示
figure,imshow(I);title('原图像');
figure,imshow(I2);title('阈值(平均)');
figure,imshow(I3);title('自动阈值');
figure,imshow(Y);title('均值');
figure,imshow(G);title('横纵');
