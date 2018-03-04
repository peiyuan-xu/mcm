clc,clear;
[x,y]=meshgrid(1:0.1:10);
z=x.*y;
mesh(x,y,z)
surf(x,y,z)
xlable('X'),ylable('Y'),zlable('Z').meshc(x,y,z);