function  [haveFlag,index] = panDuanHave( twoLci,ds )
%判断当前词库中有没有本个词条，如果有返回 1，和词条位置，没有就返回 0
LCi=size(twoLci,1); %行数
haveFlag=0;index=[];

if LCi==0
    haveFlag=0;
    index=[];
else %词库中存在值
    for i=1:LCi
        if twoLci(i,:)==ds
            index=i;
            haveFlag=1;
            break;
        end
    end
end

end

