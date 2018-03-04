A=[1 1 1 1;
    -1 -1 -1 -1];
Aeq=[2;3];
LB=[-1;-1;-1;-1];
UB=[1;1;1;1;];
x0=zeros(4,1);
options=optimoptions(@fmincon,'Algorithm','sqp');
[x faval]=fmincon(@myfun,x0,A,Aeq,[],[],LB,UB,@confun,options)