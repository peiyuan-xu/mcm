function dy = odefun( t,y)
%yÎªy(1),y'Îªy£¨2£©
dy=zeros(2,1);
%dy(2)=dy(dy(1));
dy(1)=y(2);
%dy(1)=((t^2+1)*dy(2)+2*y(1)-1)/(t+2);
dy(2)=((t+2)*y(2)+1-2*y(1))/(t^2+1);

end

