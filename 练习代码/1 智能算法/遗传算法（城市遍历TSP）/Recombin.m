function SelCh= Recombin(SelCh,Pc)
%交叉操作
% SelCh 被选择的个体 PC 交叉概率 SelCh 交叉后的个体
NSel=size(SelCh,1);
%??? 从 1 or 0
for i=1:2:NSel-mod(NSel,2)
    if Pc>=rand
        [SelCh(i,:),SelCh(i+1,:)]=intercross(SelCh(i,:),SelCh(i+1,:));
    end
end

end

