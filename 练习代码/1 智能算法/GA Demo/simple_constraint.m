function [c, ceq] = simple_constraint(x)
   c = [1.5 + x(1)*x(2) + x(1) - x(2);
   -x(1)*x(2) + 10];
   ceq = [];

end

