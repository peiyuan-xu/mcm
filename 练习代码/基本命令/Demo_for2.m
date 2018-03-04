t2=clock;
n2=1:100000;
s2=sum(1./n2.^2);
etime(clock,t2)
disp(['The answer 2: ',num2str(s)])