[x,y,z] = meshgrid(-2:.2:2,-2:.25:2,-2:.16:2);
[xsp,ysp,zsp] = sphere;
hold
%v 在上test1 的基础上
slice(x,y,z,v,[-2,2],2,-2)  % Draw some volume boundarie
for i = -2:1:2
 hsp = surface(xsp+i,ysp,zsp);
 rotate(hsp,[1 0 0],90)
 xd = get(hsp,'XData');
 yd = get(hsp,'YData');
 zd = get(hsp,'ZData');
 delete(hsp)
 hslicer = slice(x,y,z,v,xd,yd,zd);

 end
view(-10,35)
