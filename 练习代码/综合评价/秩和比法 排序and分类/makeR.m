function R= makeR(X,Low)
%编秩 ,Low 为进行低优化的数据列
[m,n]=size(X);

RI=zeros(m,1);
R=zeros(m,n);


  %%注意本次编秩的时候忽略了值相同的情况
  
for i=1:n  %每次循环处理一列数据
     XI=X(:,i);
     
    if find(i==Low)  %进行低优编秩
        for j=1:m 
            index=find(XI==max(XI));
            index=index(1);
            RI(index)=j;
            XI(index)=-inf;
          
        end
        R(:,i)=RI;
    else
        for j=1:m  %进行高优排序
            index=find(XI==min(XI));
            index=index(1);
            RI(index)=j;
            XI(index)=inf;
            
        end
        R(:,i)=RI;
    end
        
end


end

