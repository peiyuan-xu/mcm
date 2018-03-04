clc,clear;
str=input('输入给定字符串str=');
n=length(str);
if abs(str(1))>='a' && abs(str(1))<='z'
    str(1)=upper(str(1));
end
for ii=2:n
    if abs(str(ii))>='A' && abs(str(ii))<='Z'
        str(ii)=lower(str(ii));
    end
end

disp(['结果为：',str]);