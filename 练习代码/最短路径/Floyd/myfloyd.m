function [dist,mypath]=myfloyd(a,sb,db)
n=58;
path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(j,k)
                a(i,j)=a(i,k)+a(j,k);
                path(i,j)=k;
            end
        end
    end
end
dist=a(sb,db);
parent=path(sb,:);
parent(parent==0)=sb;
mypath=db;t=db;
while t~=sb
    p=parent(t);
    mypath=[p,mypath];
    t=p;
end

