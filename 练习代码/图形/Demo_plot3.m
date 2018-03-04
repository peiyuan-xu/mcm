t=0:pi/50:10*pi;

subplot(2,2,1)
plot3(rand(1,10),rand(1,10),rand(1,10)),title('The first grame')

subplot(2,2,2)
plot3(exp(-0.02*t).*sin(t),exp(-0.02*t).*cost(t),t), ...
    xlabel('x-axis'),ylabel('y-axis'),zlabel('z-axis')

