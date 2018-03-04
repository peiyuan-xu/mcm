x=linspace(0,300,30);
y=linspace(0,200,30);
[X,Y]=meshgrid(x,y);
Z=ones(size(X));
Z=Z.*rand(size(X))*90+10;
rgb=ones(size(Z));
rgb=(X.*Y+Y.*Z);
surf(X,Y,Z,rgb)
colorbar, shading flat, box on