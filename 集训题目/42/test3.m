clc, clear
A=[1 2 2 25
    1 3 3 21
    1 4 4 20
    2 5 5 19
    2 6 7 31];
x=A(:,1)'; y=A(:,2)'; z=A(:,3)'; s=A(:,4)';
xmm=minmax(x); %求x的最小值和最大值
ymm=minmax(y);
zmm=minmax(z);
y1=linspace(ymm(1),ymm(2),30);
z1=linspace(zmm(1),zmm(2),30);
x1=ones(size(y1))*x(1);
[x0,y0]=meshgrid(x1,y1);
z0=zeros(length(z1));
for i=1:size(z0,1)
    z0(i,:)=z1;
end
[r,c]=size(z0);
rgb=ones(r,c); %颜色矩阵赋初值
for i=1:length(s)
    rgb((i-1)*6+1:i*6,:)=rgb((i-1)*6+1:i*6,:)*s(i); %设置颜色矩阵
end
surf(x0,y0,z0,rgb)
colorbar, shading flat, box on
