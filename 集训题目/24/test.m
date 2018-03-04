clc
clear
syms t;                                                                                                                                                        
f=@(t)(1-cos(t)).^2.*sqrt((1-cos(t)).^2+sin(t).^2);
I=quad(f,0,2*pi);
err=abs(256/15-I);
vpa(err,5)
t=[0:pi/10:2*pi];
y=(1-cos(t)).^2.*sqrt((1-cos(t)).^2+sin(t).^2);
sp=csapi(t,y);
a=fnint(sp,1);
xx=fnval(a,[0,2*pi]);
I=xx(2)-xx(1)
