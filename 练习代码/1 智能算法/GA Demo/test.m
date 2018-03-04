%Example Á´½Ó
%https://cn.mathworks.com/help/gads/examples/constrained-minimization-using-the-genetic-algorithm.html

ObjectiveFunction=@simple_fitness;
nvars=2;
LB=[0 0];
UB=[1 13];
ConstraintFunction=@simple_constraint;
options=gaoptimset('MutationFcn',@mutationadaptfeasible);
options=gaoptimset(options,'PlotFcns',{@gaplotbestf,@gaplotmaxconstr}, ...
   'Display','iter');
X0 = [0.5 0.5]; % Start point (row vector)
options = gaoptimset(options,'InitialPopulation',X0);
[x, fval]=ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB,...
ConstraintFunction,options)