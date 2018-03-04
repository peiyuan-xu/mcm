function y= selectgbest( fvalue,pbest )
%找出粒子群中的历史最优位置
id=find(fvalue==max(fvalue));

%如果存在多个位置 fvalue 值相同，取第一个
index=id(1);
y=pbest(:,index);


end

