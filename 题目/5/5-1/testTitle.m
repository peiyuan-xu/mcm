%% 提取各个标题
clc,clear;

qianL=10;houL=12;
InFileName=['E:\data\titlesum.txt'];
fin=fopen(InFileName,'w+');
%for k=1:4
 %   disp(['第 ',num2str(k),' 次']);
    %InFileName=['E:\data\title',num2str(k),'.txt'];
    %fin=fopen(InFileName,'w+');
for i=1:49000
    disp(num2str(i));
    FileName=['E:\data\corpus\',num2str(i),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
     tline=fgetl(fid);
     L=length(tline);
     title=tline(1,10:L-houL+1); %首尾有了空格
     if ~isempty(title)
         fprintf(fin,'%s\r\n',title);
     end
     fclose(fid);
     
end

fclose(fin);


