[x y]=meshgrid(0 :5);
z=x.^2-y.^2;
mesh(z)
hold on
surf(z)