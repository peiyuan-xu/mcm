function [Z,D ] = createD( )
%初始化各个顶点的坐标和距离矩阵
%顶点 37*37
Z=zeros(37,37,2);
dx=2;dy=2;   %x y 方向上的步长增量
for i=1:37
    for j=1:37
        Z(i,j,1)=1+(i-1)*dx;
        Z(i,j,2)=1+(j-1)*dy;
    end
end

Dn=37*37;
D=zeros(Dn);
for i=1:Dn
    for j=i+1:Dn
        %顶点 i 到 顶点 j 的距离
        if mod(i,37)==0
        irow=i/37;
        else
            irow=floor(i/37)+1;
        end
        ilie=mod(i,37);
        if ilie==0
            ilie=37;
        end
        
        if mod(j,37)==0
            jrow=j/37;
        else
        jrow=floor(j/37)+1;
        end
        jlie=mod(j,37);
        if jlie==0
            jlie=37;
        end
       
        ix=Z(irow,ilie,1);iy=Z(irow,ilie,2);
        jx=Z(jrow,jlie,1);jy=Z(jrow,jlie,2);
        D(i,j)=sqrt((ix-jx)^2+(iy-jy)^2);
        D(j,i)=D(i,j);
    end
end

end

