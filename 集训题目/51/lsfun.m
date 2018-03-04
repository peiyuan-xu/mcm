function f = lsfun( x,xdata)
f=x(1).*sin(xdata(:,2))+x(2).*exp(x(3).*xdata(:,2)).*cos(xdata(:,3))+tan(x(4).*xdata(:,3));

end

