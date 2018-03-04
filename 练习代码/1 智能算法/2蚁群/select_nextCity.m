function y = select_nextCity(J,visited,Eta,Tau)
%为蚂蚁 i 寻找下一个要访问的城市
Alpha=0.8;  % 表示信息素重要的程度
Beta=5;   %表示启发式因子的重要程度
jn=length(J);
for k=1:jn
    P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta);
end

P=P./sum(P);
index=find(P==max(P));
y=J(index(1));


end

