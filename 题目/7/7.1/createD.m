function [Z,D ] = createD( )
%初始化各个顶点的坐标和距离矩阵
%顶点 8*8
Z=zeros(8,8,2);
dx=2;dy=2;   %x y 方向上的步长增量
for i=1:8
    for j=1:8
        Z(i,j,1)=1+(i-1)*dx;
        Z(i,j,2)=1+(j-1)*dy;
    end
end

Dn=8*8;
D=zeros(Dn);
for i=1:Dn
    for j=i+1:Dn
        %顶点 i 到 顶点 j 的距离
        if mod(i,8)==0
        irow=i/8;
        else
            irow=floor(i/8)+1;
        end
        ilie=mod(i,8);
        if ilie==0
            ilie=8;
        end
        
        if mod(j,8)==0
            jrow=j/8;
        else
        jrow=floor(j/8)+1;
        end
        jlie=mod(j,8);
        if jlie==0
            jlie=8;
        end
       
        ix=Z(irow,ilie,1);iy=Z(irow,ilie,2);
        jx=Z(jrow,jlie,1);jy=Z(jrow,jlie,2);
        D(i,j)=sqrt((ix-jx)^2+(iy-jy)^2);
        D(j,i)=D(i,j);
    end
end

end

