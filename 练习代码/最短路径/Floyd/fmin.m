clc,clear
n=58;
a=textread('¾àÀë¾ØÕóÔ´Êý¾Ý.txt');
a(a==Inf)=0;
a=a+a'
a(a==0)=inf;
a([1:n+1:n^2])=0
a=a+a';
a(a==0)=inf;
a([1:n+1:n^2])=0;
a
path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(j,k)
                a(i,j)=a(i,k)+a(j,k);
                path(i,j)=k;
            end
        end
    end
end
a,path
xlswrite('luchang.xls',a)
xlswrite('lujing.xls',path)

