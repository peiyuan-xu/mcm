function y = f( x )
n=length(x);
for i=1:n
    if x(i)>0
        y(i)=exp(-x(i)^2)*sin(x(i));
    else
        y(i)=2+(cos(x(i)))^2;
    end
end

end

