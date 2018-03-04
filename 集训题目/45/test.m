clc,clear;
str=input('输入要查找的字符串：');
S=input('输入要查找的字符：');
snum=length(str);
num=length(S);
f=zeros(1,num);
for i=1:num   %每循环一次查找一个字符的次数位置
    st=S(i);
    fplace=[];
    for j=1:snum  %遍历所有的字符
        if str(j)==st
            f(i)=f(i)+1;
            fplace=[fplace,j];
        end
    end
    disp(['字符 ',st]);
    disp(['出现的次数为：',num2str(f(i))]);
    disp('出现的位置依次为：'),disp(fplace);
end

            
            