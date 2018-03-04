function D= Distance( x )
%由坐标计算各个城市之间的距离

n=size(x,1);
D=zeros(n);
for i=1:n
    for j=i+1:n
        
           D(i,j)=sqrt((x(i,1)-x(j,1))^2+(x(i,2)-x(j,2))^2);
           D(j,i)=D(i,j);
    end
end


end

