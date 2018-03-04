%层次分析法，一个毕业生根据 一些条件选工作, 本程序准则层有两层
%连接 http://blog.sina.com.cn/s/blog_789baed301010ppc.html
clc,clear;
%目标层A，判断矩阵a是aij  是元素 ui 与 uj 相对于C的重要性的比例标度

a=[1,1/3,1/3
3,1,1
3,1,1];
[n,n]=size(a);
[x,y]=eig(a);eigenvalue=diag(y);pos=find(max(eigenvalue));lamda=max(eigenvalue); %x为特征向量，y为特征值，lamda为最大特征值，
%lamda=max(eigenvalue)亦可为lamda=eigenvalue(2)，第二个特征值恰为最大特征值

w1=abs(x(:,pos));
w1=w1/sum(w1);                                  %准则层B对目标层的单排序，也是总排序
%以下是一致性检验
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59 1.60 1.61 1.615 1.62 1.63];
CI1=(lamda-n)/(n-1);
CR1=CI1/RI(n);
check_CR(CR1,CI1);

%第一准则层对第二准则层
b1=[1,1;1,1];
[m,m]=size(b1);
[x,y]=eig(b1);eigenvalue=diag(y);pos=find(max(eigenvalue));lamda=max(eigenvalue);
w21=abs(x(:,pos));  %准则层C中C1、C2对B层中B1的单排序
w21=w21/sum(w21);
CI21=(lamda-m)/(m-1);
CR21=CI21/RI(m);
check_CR(CR21,CI21);

b2=[1  3;1/3,1];
[x,y]=eig(b2);eigenvalue=diag(y);pos=find(max(eigenvalue));lamda=max(eigenvalue);
w22=abs(x(:,pos));                                  %准则层C中C3、C4对B层中B2的单排序
w22=w22/sum(w22);
CI22=(lamda-m)/(m-1);
CR22=CI22/RI(m);
check_CR(CR22,CI22);

b3=[1 3;1/3 1];
[x,y]=eig(b3);eigenvalue=diag(y);pos=find(max(eigenvalue));lamda=max(eigenvalue);
w23=abs(x(:,pos));                               %准则层C中C5、C6对B层中B3的单排序
w23=w23/sum(w23);
CI23=(lamda-m)/(m-1);
CR23=CI23/RI(m);
check_CR(CR23,CI23);

c1=[1  5;1/5  1];
[m,m]=size(c1);  %注意此处为措施层的宽度
[x,y]=eig(c1);eigenvalue=diag(y);lamda=max(eigenvalue);
pos=find(max(eigenvalue));
w31=abs(x(:,pos));                              
w31=w31/sum(w31);
CI31=(lamda-m)/(m-1);
CR31=CI31/RI(m);
check_CR(CR31,CI31);%措施层D对C层中C1的单排序 

c2=[1  3;1/3   1];
[x,y]=eig(c2);eigenvalue=diag(y);lamda=max(eigenvalue);
pos=find(max(eigenvalue));
w32=abs(x(:,pos));                              
w32=w32/sum(w32);
CI32=(lamda-m)/(m-1);
CR32=CI32/RI(m);
check_CR(CR32,CI32);%措施层D对C层中C2的单排序

c3=[1  1/5;5   1];
[x,y]=eig(c3);eigenvalue=diag(y);lamda=max(eigenvalue);
pos=find(max(eigenvalue));
w33=abs(x(:,pos));                              
w33=w33/sum(w33);
CI33=(lamda-m)/(m-1);
CR33=CI33/RI(m);
check_CR(CR33,CI33);%措施层D对C层中C3的单排序

c4=[1  7;1/7   1];
[x,y]=eig(c4);eigenvalue=diag(y);lamda=max(eigenvalue);
pos=find(max(eigenvalue));
w34=abs(x(:,pos));                              
w34=w34/sum(w34);
CI34=(lamda-m)/(m-1);
CR34=CI34/RI(m);
check_CR(CR34,CI34);                               %措施层D对C层中C4的单排序

c5=[1  1/5;5   1];
[x,y]=eig(c5);eigenvalue=diag(y);lamda=max(eigenvalue);
pos=find(max(eigenvalue));
w35=abs(x(:,pos));                              
w35=w35/sum(w35);
CI35=(lamda-m)/(m-1);
CR35=CI35/RI(m);
check_CR(CR35,CI35);                               %措施层D对C层中C5的单排序

c6=[1  1/3;3   1];
[x,y]=eig(c6);eigenvalue=diag(y);lamda=max(eigenvalue);
pos=find(max(eigenvalue));
w36=abs(x(:,pos));                              
w36=w36/sum(w36);
CI36=(lamda-m)/(m-1);
CR36=CI36/RI(m);
check_CR(CR36,CI36);                                %措施层D对C层中C6的单排序

w_sum1=[w21*w1(1,1)
w22*w1(2,1)
w23*w1(3,1)];
                                      %准则层C总排序
%w_sum2=[[w31,w32]*w21,[w33,w34]*w22,[w35,w36]*w23]*w1  %措施层D总排序
w_sum2=[w31 w32 w33 w34 w35 w36]*w_sum1;

CI1=[CI21,CI22,CI23];
CR1=CI1*w1/sum(0.52*w1);                               %准则层C总排序的整体一致性检验
check_CR(CR1,CI1);
CI2=[CI31,CI32,CI33,CI34,CI35,CI36];                   %措施层D总排序的整体一致性检验
%问题  为什么* 0，
CR2=CI2*w_sum1/sum(0*w_sum1);
check_CR(CR2,CI2);
disp('最终各个措施权重比例为：');disp(w_sum2);