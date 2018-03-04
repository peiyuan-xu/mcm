clc,clear;
[x,y]=meshgrid(-5:0.1:5);
z=x.*exp(-x.^2-y.^2);
contour3(x,y,z);
title('ÌÝ¶È³¡');
