function f = fitness(x)
p=[800,1400,1250,1000];%c
q=[500,900,40,400];%b
q=1./q;
z=0;y=0;
for i=1:4
    c(i)=p(i)/sum(p);
    z=c(i)*x(i)+z;
    b(i)=q(i)/sum(q);
    y=b(i)*x(i)+y;
end
d=shendu(x);
f=0.5*d+0.3*z+0.2*y;
end

