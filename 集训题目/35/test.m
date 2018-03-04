clc
clear
f1=@(x,y)[y(2);
    2*x/(1+x^2)*y(2)-2/(1+x^2)*y(1)+1];
f2=@(ya,yb)[ya(1)-1.25;yb(1)+0.95];
sinit=bvpinit(linspace(0,4,10),rand(2,1));
sol=bvp5c(f1,f2,sinit);
plot(sol.x,sol.y)
