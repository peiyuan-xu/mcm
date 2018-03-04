function f = myfun( x )
%MYFUN 此处显示有关此函数的摘要
c=[6 8 4 2];
Q=[-1 -1 0 0
   -1 -1 -1 0
   0 -1 -1 -1
   0 0 -1 -1];
f=-c*x-0.5*x'*Q*x;


end

