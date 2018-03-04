[x,y,z]=meshgrid(-180:180,-90:90,-23.5:23.5);
v=Fitness1;
xslice=[180];yslice=[90];
chiSlice=[-5.5,3.5,7.5,21.5];
slice(x,y,z,v,xslice,yslice,chiSlice);
colormap hsv