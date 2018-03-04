function lineNum= changeNum(tline)
%将每行字符用 1 代替，其他用 0 代替

%特殊符号集
teFu=[' ' '－' '！' '(' ')' '「' '」' '.' '、' '：' '／' '？' '《' '》' '&' '，' '〈' '〉' '/' '…' '%' '【' '】' '+' '#'];
LteFu=25;

tL=length(tline);
lineN=zeros(1,tL);
for i=1:tL  %对tline中每个字符与特殊集比较
    index=find(tline(i)==teFu);
    if ~isempty(index)  %为特殊集中元素
        lineN(i)=0;
    else  %非特殊集
        lineN(i)=1;
    end
end
lineNum=lineN;

end

