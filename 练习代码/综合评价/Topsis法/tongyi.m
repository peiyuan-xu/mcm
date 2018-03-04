function Z = tongyi( X,Lowflag )
%将数据进行归一化和统一量纲,行对应对象   列对应没个目标的数据

[m,n]=size(X);
nl=length(Lowflag);
Z=zeros(m,n);

for i=1:n
    if find(Lowflag==i)  %当为 低优 指标时 采用此函数
        XI=X(:,i);
        Xsum=sum((1./XI).^2);
        ZI=(1./XI)./(sqrt(Xsum));
        Z(:,i)=ZI;
    else    %对高优指标进行变换
        XI=X(:,i);
        Xsum=sum(XI.^2);
        ZI=XI./(sqrt(Xsum));
        Z(:,i)=ZI;
    end
end

       
end

