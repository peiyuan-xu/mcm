function d = shendu(dH)
%求深度输入各层深度
%% 1 初始化参数  共5 层
k=[0.1675;1.74;0.82;0.03;1.41;0.95];
c=[0.921;0.84;0.19;5.346;0.78;0.73];
p=[1.092;2.5;1.5;0.025;2.19;2.02];
%ChaX=1:12;
%ChaY=[-1.6 1.5 5.2 8.4 12.3 15.9 15.7 14.7 12.9 8.7 2.9 -1.2];
%输入各层厚度
D(1)=dH(1);
for i=2:4
    D(i)=D(i-1)+dH(i);
end
D(5)=D(4)+400;
%时间步长为 t 距离步长为 h
t=0.0001;
h=1;
%空气温度 和 冻土温度
%wenq=10;wend=-10;
wenq=15.9;wend=-15;
%距离格数为 m ,时间格数为 n
%m=floor(h5/h);
n=10000;
%记录特殊格数，即层次相邻的格数序号
Tg=zeros(4,2);
xu=zeros(5,2);xu(1,1)=2;
for i=1:4
Tg(i,1)=floor(D(i)/h);
Tg(i,2)=Tg(i,1)+1;
xu(i,2)=Tg(i,1)-1;
xu(i+1,1)=Tg(i,2)+1;
end
%距离总格数为 m
 m=floor(D(5)/h);
xu(5,2)=m-1;
%初始化记录温度的数组
wen=zeros(m,n);

wen(1,:)=wenq;wen(m,:)=wend;
dwen=(wenq-wend)/m;
for i=2:m
   wen(i,1)=wenq-dwen*i;
end

%初始化初始点的温度 
for i=2:m
    wen(i,1)=wenq-dwen*i;
end

f=(k./(c.*p)).*(t/(h^2));
%% 2 通过不断更新格数中的值，以趋近平衡状态
for i=2:n   %每一次时间走一步
    %disp(['时间前进 ',num2str(i-1),' 步']);
       for ki=1:5
           for j=xu(ki,1):xu(ki,2)
              wen(j,i)=f(ki)*(wen(j+1,i-1)+wen(j-1,i-1))+(1-2*f(ki))*wen(j,i-1);
           end
       end
        %更新特殊格
        for ik=1:4  %4 层的特殊格，
             wen(Tg(ik,1),i)=(k(ik)*wen(Tg(ik,1)-1,i)+k(ik+1)*wen(Tg(ik,2)+1,i))/(k(ik)+k(ik+1));
             wen(Tg(ik,2),i)=wen(Tg(ik,1),i);
        end
        
  
end
%% 2 找温度为 0 的深度
index=find(wen(:,n)<0);
index=index(1);
zeroD=h*index;
%disp(['温度为 0 的深度为：',num2str(zeroD)]);
%disp(num2str(wen(:,n)));
d=zeroD-D(4);

end

