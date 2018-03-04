function [S,R ] = Metropolis(S1,S2,D,T)
%S1当前解   S2新解 D距离矩阵 T当前温度
% 输出 S下一个当前解 R下一个当前解的路线
R1=PathLength(D,S1);  %计算路线长度
N=length(S1); %得到城市的个数

R2=PathLength(D,S2);
dC=R2-R1; %能量之差
if dC<0   %能量降低，接受新解
    S=S2;
    R=R2;
elseif exp(-dC/T)>=rand  %以exp(-dC/T)概率接受新解
    S=S2;
    R=R2;
else
    S=S1;
    R=R1;   %不接受新的路线
end


end

