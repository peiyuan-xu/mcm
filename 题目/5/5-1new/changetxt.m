%% 只提取第一列文字
FileName=['E:\data\pinGE.txt']; 
fid=fopen(FileName,'r+','n','utf-8');
InFileName=['E:\data\titletxt.txt'];
InFileF=['E:\data\twof.txt'];
fin=fopen(InFileName,'w+');

    while ~feof(fid)  %读完文件
         tline=fgetl(fid);
        % L=length(tline);  %读取一行
        index=find(' '==tline);
        index=index(1)-1;
        strtitle=tline(1,1:index);
        
        if ~isempty(strtitle)
         fprintf(fin,'%s\r\n',strtitle);
        end
    end
    fclose(fid);
    fclose(fin);
        