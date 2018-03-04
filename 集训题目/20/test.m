syms x y z
z=x*exp(2*y);
v=[sqrt(2)/2,-sqrt(2)/2];
grad=jacobian(z);
T=dot(grad,v);
subs(subs(T,'x',1),'y',0)
