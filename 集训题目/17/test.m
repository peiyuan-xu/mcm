clc
clear
syms x;
f=(x.^2+2.*x+3).*exp(-2.*x);
fx=diff(f)
ezplot(fx,[0,1]);
hold on
x=[0:0.1:1];
y=(x.^2+2.*x+3).*exp(-2.*x);
sp=csapi(x,y);
dsp=fnder(sp,1);
fnplt(dsp,':y');
legend('理论','三次样条');
