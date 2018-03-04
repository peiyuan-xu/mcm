function [c, ceq] = simple_constraint2(x)
%such that the following two nonlinear constraints and 
%bounds are satisfied

 %  x1*x2 + x1 - x2 + 1.5 <=0, (nonlinear constraint)
 % 10 - x1*x2 <=0,            (nonlinear constraint)
 %0 <= x1 <= 1, and          (bound)
 %0 <= x2 <= 13              (bound)
   
c=[1.5 + x(1)*x(2) + x(1) - x(2);
    -x(1)*x(2) + 10];
ceq=[];


end

