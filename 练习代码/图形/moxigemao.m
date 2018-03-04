[x y]=meshgrid(-8 : 0.5 :8);
r=sqrt(x.^2+y.^2)+eps;
z=sin(r)./r;
subplot(1,2,1);
surf(z)
subplot(1,2,2);
meshc(x,y,z)