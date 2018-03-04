function y = simple_fitness( x )
%We want to minimize a simple fitness function of two variables x1 and x2
% min f(x) = 100 * (x1^2 - x2) ^2 + (1 - x1)^2;

y=100*(x(1)^2 - x(2))^2+(1 - x(1))^2;

end

