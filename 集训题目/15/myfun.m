function f= myfun(x,xdata)
f=x(1).*(xdata(:,1)).^2+x(2).*xdata(:,1).*xdata(:,2)+x(3).*(xdata(:,2)).^2-3;


end

