function V= vInScope(V,Vscope)
%保证速度不越界
[m,n]=size(V);
for i=1:m
    for j=1:n
        if V(i,j)<Vscope(2,j)  %小于对应维度速度的下限
            V(i,j)=Vscope(2,j);
        elseif V(i,j)>Vscope(1,j)
            V(i,j)=Vscope(1,j);
        end
    end
end

end

