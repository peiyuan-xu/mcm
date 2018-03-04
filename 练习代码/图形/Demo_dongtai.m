x=0;
y=0;
dx=pi/40;
p=plot(x,y,'o','EraseMode','none');
axis([0 20*pi -2 2])
for x=dx:dx:20*pi
    x=x+dx;
    y=sin(x);
    set(p,'XData',x,'YData',y);
    drawnow
end