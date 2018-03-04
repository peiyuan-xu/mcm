ObjectiveFunction=@simple_fitness;
nvars=2;
LB=[-10 -10];
UB=[10 10];
ConstraintFunction=@simple_constraint;
options=gaoptimset('PlotFcns',{@gaplotbestf,@gaplotmaxconstr}, ...
   'Display','iter');
X0 = [5 5]; % Start point (row vector)
options = gaoptimset(options,'InitialPopulation',X0);
[x, fval]=ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB,...
ConstraintFunction,options)