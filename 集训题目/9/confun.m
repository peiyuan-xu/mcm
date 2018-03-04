function [c ceq ] = confun( x )
%CONFUN 此处显示有关此函数的摘要
%  noline
c=[x(1)*x(2)+x(3)*x(4);
    -x(1)*x(2)-x(3)*x(4)];
ceq=[1;1];

end

