%输入各个网页的邻接矩阵
%输入 [0 1 0 0 0 0; 0 0 1 1 0 0;0 0 0 1 1 1 ;1 0 0 0 0 0;0 0 0 0 0 1;1 0 0 0 0 0]
%40题 输入[0 1 0 0 0 0;0 0 1 0 0 0;1 0 0 1 0 0;1 0 0 0 1 1;0 0 0 0 0 1;0 1 0 0 0 0]

clc,clear;
Blink=input('请输入各个网页的邻接矩阵，连为1，空为0：');
%第 i 行为网页 i 连出的网页  ；第 j 列为网页连到 j 网页
[n,m]=size(Blink);
N=n;
%得到每行每列和
for i=1:n
    c(i)=sum(Blink(:,i));
    r(i)=sum(Blink(i,:));  %为连出

end

%%定义Markov链的转移概率矩阵 A
d=0.85;
for i=1:n
    for j=1:n
        A(i,j)=(1-d)/N+d*(Blink(i,j)/r(i));
    end
end

%%根据Markov链的基本性质还可以得到，
%平稳分布（即PageRank值）是转移概率矩阵 A 的转置矩阵 的最大特征值（=1 ）所对应的归一化特征向量
A=A';
[V,D]=eig(A);%求得特征向量和 特征值
            %求出最大特征值和它所对应的特征向量
 eigenvalue=diag(D);
 pos=find(max(eigenvalue)); %x为特征向量，y为特征值，lamda为最大特征值，
 lamda=eigenvalue(pos);
 w1=abs(V(:,pos));
 w1=w1/sum(w1);
 disp('第一种算法的结果为：');disp(w1);
 
 %%第二中方法为
 %A=A';  %还原A
 Z0=zeros(n,1);
 x=(A-1)\Z0;
 disp('x为：');disp(x);
 sum=sum(x);
 disp('x综合为：');disp(sum);

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
        

