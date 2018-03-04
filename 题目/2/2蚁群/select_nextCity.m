function y = select_nextCity(J,visited,Eta,Tau,NC,NC_max)
%为蚂蚁 i 寻找下一个要访问的城市
Alpha=2;  % 表示信息素重要的程度
Beta=1;   %表示启发式因子的重要程度
q0=0.1;
q=q0+0.8*NC/NC_max;
jn=length(J);
for k=1:jn
    P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta);
end

randp=rand();
if randp<q
P=P./sum(P);
index=find(P==max(P));
y=J(index(1));
else
    index=floor(jn*rand())+1;
    y=J(index);
end


end

