clc,clear
%%
I=imread('test.bmp');
I=rgb2gray(I);
H=fspecial('gaussian',[4,4],0.2);
WImage3=imfilter(I,H);
figure,imshow(WImage3,[]);
title('高斯低通滤波后图像');

% 中值滤波平滑

J = medfilt2(I);

figure,imshow(J,[]);

title('中值滤波平滑');

K1=filter2(fspecial('average',3),I)/255;

%进行3*3均值滤波

K2=filter2(fspecial('average',5),I)/255;

%进行5*5均值滤波

K3=filter2(fspecial('average',7),I)/255;

%进行7*7均值滤波

figure,imshow(K1)

figure,imshow(K2)

figure,imshow(K3)
