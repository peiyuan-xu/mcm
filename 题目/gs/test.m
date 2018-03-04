%% 图像处理
clc,clear;
ImagesN=1;
for i=1:ImagesN
sFileFullName=['E:\data\1gs\',num2str(i),'.bmp'];
%imagesfilename = textread(sFileFullName,'%s');
%imagename=char(imagesfilename(1));
A=imread(sFileFullName);
%转换为灰度图像
Ai=rgb2gray(A); 
%剪切图像
%rowStart=760;rowEnd=959;colStart=810;colEnd=1699;
rowStart=849;rowEnd=898;colStart=810;colEnd=1699;
CutA=Ai(rowStart:rowEnd,colStart:colEnd);
%figure
%imshow(CutA);
%图像二值化处理
w1=0.3922;w2=0.7176;
Atwo=zeros(size(CutA));
for i=1:125
Atwo(:,i)=im2bw(CutA(:,i),w1);
end
for i=126:890
    Atwo(:,i)=im2bw(CutA(:,i),w2);
end
A
figure
imshow(Atwo);
end