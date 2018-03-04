function position= pInScope( position,Pscope)
%保证离子位置不越界
[m,n]=size(position);
for i=1:m
    for j=1:n
        if position(i,j)<Pscope(2,j)  %小于对应维度速度的下限
            position(i,j)=Pscope(2,j);
        elseif position(i,j)>Pscope(1,j)
            position(i,j)=Pscope(1,j);
        end
    end
end


end

