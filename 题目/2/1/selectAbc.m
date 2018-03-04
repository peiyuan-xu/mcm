function [ As,Bs,Cs ] = selectAbc( disaster,service,a,b,c,demand )
%检验调整a b c

d1=a*sqrt((disaster(:,1)-service(1,1)).^2+(disaster(:,2)-service(1,2)).^2);
d2=b*sqrt((disaster(:,1)-service(2,1)).^2+(disaster(:,2)-service(2,2)).^2);
d3=c*sqrt((disaster(:,1)-service(3,1)).^2+(disaster(:,2)-service(3,2)).^2);

ad=[];bd=[];cd=[];
n=length(d1);
for i=1:n
    if d1(i)==min([d1(i),d2(i),d3(i)])
        la=length(ad);
        ad=[ad(1:la),i];
    elseif  d2(i)==min([d1(i),d2(i),d3(i)])
        lb=length(bd);
        bd=[bd(1:lb),i];
    else    
         %d3(i)==min([d1(i),d2(i),d3(i)])
           lc=length(cd);
          cd=[cd(1:lc),i];
     end
end
%求各类总和
xuA=ad;
la=length(ad);
sumdemand=0;
for i=1:la
    indexa=xuA(i);
    sumdemand=sumdemand+demand(indexa);
end
As=sumdemand;
disp(['A类 共需要：',num2str(sumdemand)]);

xuB=bd;
la=length(bd);
sumdemand=0;
for i=1:la
    indexa=xuB(i);
    sumdemand=sumdemand+demand(indexa);
end
Bs=sumdemand;
disp(['B类 共需要：',num2str(sumdemand)]);

xuC=cd;
la=length(cd);
sumdemand=0;
for i=1:la
    indexa=xuC(i);
    sumdemand=sumdemand+demand(indexa);
end
Cs=sumdemand;
disp(['C类 共需要：',num2str(sumdemand)]);

end

