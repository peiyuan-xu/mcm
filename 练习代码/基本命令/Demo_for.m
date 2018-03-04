t0=clock;
s=0;
for n=1:100000;
   s=s+1/n^2;
end
etime(clock,t0)
disp(['Already',num2str(s)])