function f = myfun(x,xdata)

f=exp(x(1).*xdata(:,1)).*sin(x(2).*xdata(:,2))+x(3).*xdata(:,1).*cos(xdata(:,2));

end

