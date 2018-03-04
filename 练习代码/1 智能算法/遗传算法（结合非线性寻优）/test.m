function flag= test( lenchrom,bound,oneChrom)
%判读染色体是否符合要求
L=length(lenchrom);
for i=1:L
    if oneChrom(1,i)<bound(i,1) || oneChrom(1,i)>bound(i,2)
        flag=0;
        break;
    end
end
if i==L
    flag=1;
end


end

