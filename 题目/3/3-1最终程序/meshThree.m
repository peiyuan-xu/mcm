function [ ] = meshThree(W)
[m,n]=size(W);
[X,Y]=meshgrid(1:100);
for i=1:m
    Z=ones(100,100)*W(i,1);
    mesh(X,Y,Z);
    hold on;
end

end

