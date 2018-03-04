%% 计算 两个字的频率，标题文件每行首尾 有空格   !!!!!!!!!!!!!!!!!!!!!!

individuals=struct('twoLCi',[],'f',[]);  %种群结构体

i=1;
%FileName=['E:\data\title',num2str(i),'.txt'];  %读取一个title文件

FileName=['E:\data\titlesum.txt']; 
    fid=fopen(FileName,'r+','n','utf-8');
    CiNum=1;
     while ~feof(fid)  %读完文件
         tline=fgetl(fid);
         L=length(tline);  %读取一行
         
         lineNum=changeNum(tline);  %将字符用1 代替，其他用 0
         for j=2:L-2 %遍历一行，统计记录 两个字的词
             if lineNum(j-1)==0 && lineNum(j)==1 &&lineNum(j+1)==1 && lineNum(i+2)==0
                 ds=[tline(j),tline(j+1)];
                 disp(ds);
                 %判断当前词库中有没有本个词条，如果有返回 1，和词条位置，没有就返回 0
                 [haveFlag,index]=panDuanHave(individuals.twoLCi,ds);
                 if haveFlag==0  %第一次记录该词条
                     individuals.twoLCi(CiNum,:)=char(ds);   %记录词条
                    % CiTiao(CiNum,:)=char(ds);
                     %此时 f(CiNum)为空，第一次使用
                     individuals.f(CiNum)=1;
                     CiNum=CiNum+1;
                 else   %存在该词条
                     individuals.f(index)=individuals.f(index)+1;
                 end
             end
         end
     end
       CiTiao=char(individuals.twoLCi);              
       pinLv=individuals.f; 
       fclose(fid);
       
      % for i=1:500 %前50个比较热的词条
       %    index=find(max(pinLv)==pinLv);
        %   index=index(1);
         %  disp([CiTiao(index,:),num2str(pinLv(index))]);
          % pinLv(index)=0;
      % end
%%   将结果写入文件CiTao pinLv
P=pinLv;
InFileName=['E:\data\two.txt'];
fin=fopen(InFileName,'w+');
cinum=size(CiTiao,1);
disp('将结果写入two文件');
for  i=1:cinum
      maxf=max(P);
      if maxf>1
      index=find(P==maxf);index=index(1);
      tline=[CiTiao(index,:),' ',num2str(pinLv(index))];
      if ~isempty(tline)
         fprintf(fin,'%s\r\n',tline);
      end
      %统计过后的词条不再统计
      P(index)=0;
      end
end
fclose(fin);
             
         