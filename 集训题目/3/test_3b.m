u=0:pi/40:2*pi;
v=0:pi/40:2*pi;
[U,V]=meshgrid(u,v);
x=(1+cos(U)).*cos(V);
y=(1+cos(U)).*sin(V);
z=sin(U);
plot3(x,y,z)
