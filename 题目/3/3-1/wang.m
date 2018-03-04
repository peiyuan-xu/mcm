function main
%热传导方程的差分解法
lda=0.000015;%lad即为a^2
l=50;
h=0.05;%空间步长
alpha=0.5;
tao=alpha*h^2/lda; %时间步长
N=l/h;%空间步数
M=100;%时间步数，由于你条件没有限制，所以我随便取了个值
for i=1:N+1
u(1,i)=fai((i-1)*h);
end
for k=1:M
u(k,1)=g1(k*tao);
u(k,N+1)=g2(k*tao);
end
for k=1:M
for i=2:N
u(k+1,i)=alpha*u(k,i+1)+(1-2*alpha)*u(k,i)+alpha*u(k,i-1);
end
plot([0:h:l],u(k+1,:)); 
hold on; pause(0.05);
end
function u=fai(x)
u=100;
function u=g1(x)
u=0;
function u=g2(x)
u=0;

