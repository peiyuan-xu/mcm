function f=Fun3(dislist,s)
%s=dislist(:,1);
[zl,d,b]=shiyinhanshu3(dislist,s);
for i=1:37
    a(i)=max(d(i,3)-b(i,6),0);
end
m=1000000;
f=m*sum(a)+9*zl;
%f=sum(a);