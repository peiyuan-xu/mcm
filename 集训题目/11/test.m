clc,clear;
S=[];
for i=100:999
    if i==(floor(i/100))^3+(floor((i-100*floor(i/100))/10))^3 +(mod(i,10))^3 
       S=[S,i];
    end
end
disp('Ë®ÏÉ»¨Êý£º');disp(S);