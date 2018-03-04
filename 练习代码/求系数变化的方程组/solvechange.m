function [px,py]= solvechange(cg,c2,a,b)
%计算两个曲线的交点，cg ,c2 ,a, b 为传过来的参数
syms x;
yx=solve(cg*(x^a)-c2/(x^b));
y1=yx(1);
y=double(y1);
y=real(y);
yy=cg*(y^a);
disp('输出x,y');
px=y;
py=yy;
end

