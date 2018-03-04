
bu=40;
%a=round(rand(10));
%a=ones(10)
a=JiQiZhen;
c=size(a);
k=0;
d=a;
for i=1:c(1)
    for j=1:c(2)
        if(a(i,j)==3)
            k=k+1;
            d(i,j)=k;
        end
    end
end
b=inf*ones(k);
for i=1:c(1)
    for j=1:c(2)
        for p=0:c(1)
            for q=0:c(2)
                if(i+p<=c(1) && j+q<=c(2))  
                    if(a([i:i+p],[j:j+q])==ones(p+1,q+1))
                        b(d(i,j),d(i+p,j+q))=bu*sqrt(p^2+q^2);
                        b(d(i,j+q),d(i+p,j))=bu*sqrt(p^2+q^2);
                    end
                    if(a([i:i+p],j)==ones(p+1,1))
                        b(d(i,j),d(i+p,j))=bu*p;
                    end
                    if(a(i,[j:j+q])==ones(1,q+1))
                        b(d(i,j),d(i,j+q))=bu*q;
                    end
                end
            end
        end
    end
end
for i=1:k
    for j=1:i
    b(i,j)=b(j,i)
    end
end