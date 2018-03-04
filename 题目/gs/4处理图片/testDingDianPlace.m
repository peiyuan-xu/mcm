clc,clear;
%% 初始化变量
ImagesN=14;
DingDian=zeros(ImagesN,2);
YingL=zeros(14,1);
rowStart=849;rowEnd=898;colStart=810;colEnd=1699;
YuanDianRow=890;YuanDianCol=867;
%单位像素对应的现实长度
dL=2/672;
%% 1 处理图片，获取影子顶点的位置

for K=1:ImagesN   
%1-1 每次处理一张图片
sFileFullName=['E:\data\1gs\',num2str(K),'.bmp'];
A=imread(sFileFullName);
%1-2 转换为灰度图像
Ai=rgb2gray(A); 
%1-3 剪切图像
%rowStart=760;rowEnd=959;colStart=810;colEnd=1699;
%rowStart=849;rowEnd=898;colStart=810;colEnd=1699;
CutA=Ai(rowStart:rowEnd,colStart:colEnd);
%1-4 图像二值化处理
w1=0.3922;w2=0.7176;
Atwo=zeros(size(CutA));
for i=1:125
Atwo(:,i)=im2bw(CutA(:,i),w1);
end
for i=126:890
    Atwo(:,i)=im2bw(CutA(:,i),w2);
end
%1-5 图片‘闭合’处理
AI4=bwmorph(Atwo,'open');
%AI5=bwmorph(AI4,'close');
%figure
%imshow(Atwo);
%figure(2)
%imshow(AI4);
AI4=double(AI4);
%1-6 将1和0进行置换，求顶点位置
AIHuan=~AI4;
colSumA=sum(AIHuan,1);
index=find(colSumA>0);
DingCol=max(index)  %影子顶点所在的列数
%求影子顶点对应的行数
index=find(AIHuan(:,DingCol)==1);
numofIn=length(index);
DingRow=sum(index)/numofIn
%DingDian(K,1)=DingRow;
%DingDian(K,2)=DingCol;
%将影子的顶点根据底座中心，进行坐标调整
DingDian(K,1)=YuanDianRow-DingRow-rowStart;
DingDian(K,1)=DingDian(K,1)*dL;
DingDian(K,2)=colStart+DingCol-YuanDianCol;
DingDian(K,2)=DingDian(K,2)*dL;
YingL(K,1)=(sum(DingDian(K,:).^2)).^0.5;
disp(['第 ',num2str(K),' 张图片']);
%disp(['顶点的行数：',num2str(DingRow)]);
%disp(['顶点的列数：',num2str(DingCol)])
end
plot([8.9:0.05:9.55],YingL);
xlabel('时间/小时');ylabel('影长/米');