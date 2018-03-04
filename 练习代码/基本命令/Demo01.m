a=2;
x=a/2;
disp(['The approach to sqrt(a) for a=',num2str(a)])
for i=1:6
    x=(x+a/x)/2;
    disp(x);
end
disp('Matlab"s value:')
disp(sqrt(2))