function f=Fun(dislist,s)
%s=dislist(:,1);

[zl,d,b]=shiyinhanshus(dislist,s);
for i=1:32
    a(i)=max(d(i,3)-b(i,6),0);
end
m=1000000;
%f=m*sum(a)+9*zl;
f=m*sum(a)+zl*9;