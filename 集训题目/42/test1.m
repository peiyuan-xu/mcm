[x,y,z] = meshgrid(-2:.2:2,-2:.25:2,-2:.16:2);	
v = x.*exp(-x.^2-y.^2-z.^2);
xslice = [-1.2,.8,2]; yslice = 2; zslice = [-2,0];
slice(x,y,z,v,xslice,yslice,zslice)
colormap hsv