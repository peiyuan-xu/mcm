function [ newpbest,newpf,newgbest,newgF] = updateBest(position,pbest,gbest,pfvalue,fvalue,gbestF,ParticleScope)
%更新种群最优记录
%pbest 离子历史最优位置  fvalue 离子历史最优适应度
N=size(pbest,1);%N个个体

for i=1:N
    if pfvalue(i)>fvalue(i)  %新的位置的 自适应度 大于历史最优的
        pbest(i,:)=position(i,:);
        fvalue(i)=pfvalue(i);
    end
end

%加入随机因素 进一步 更新最优离子历史最优
%newpbest=zeros(size(pbest));
%newpf=zeros(N,1);
%！！！！！！！！！  1
%for i=1:N
 %   r=rand;
  %  while r==0
   %     r=rand;
    %end
    %c=floor(r*N)+1;
    %更新位置,适应度
    
    %newpbest(i,:)=r*pbest(i,:)+(1-r)*pbest(c,:);
    %newpbest(i,:)=pbest(i,:);
    %newpf(i,1)=r*fvalue(i)+(1-r)*fvalue(c);
    %newpf(i,1)= fitness(newpbest(i,:));
%end
newpbest=pbest;
newpf=fvalue;
[newgbest,newgF]=SelectGbest(newpbest,gbest,newpf,gbestF,ParticleScope);
end

