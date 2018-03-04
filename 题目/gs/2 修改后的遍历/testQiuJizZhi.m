%求极值
F=Fitness1;
[m,n]=size(F);
indexN=1;
for i=3:m-2
    for j=3:n-2
        
        fnow=F(i,j);
        ftest=F(i-2:i+2,j-2:j+2);
        ftestMax=max(ftest(:));
        %ftestMax=ftestMax(1);
        %if fnow>fshang1 && fnow>fshang2 &&fnow>fxia1 && fnow>fxia2
            %记录
           if ftestMax~=0&&ftestMax==fnow
            IndexJi(indexN,1)=91-i;IndexJi(indexN,2)=-180+j-1;
            IndexZhi(indexN,3)=F(i,j);
            
            indexN=indexN+1;
            disp(['第 ',num2str(indexN),' 个']);
        end
    end
end
