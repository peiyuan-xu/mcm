function y=simple_fitness(x)
y=-(0.5+((sin(sqrt(x(1)^2+x(2)^2)))-0.5)/(1 + 0.001*(x(1)^2+x(2)^2)));

end

