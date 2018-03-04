%% 通过各个词条的频数和长度，确定截断位置
Fsum=Cif;
[newCif,newIndex]=sort(Fsum,'descend');
L=length(newCif);
sortCiKu={};sortCiN=[];
%将数据排序后记录
oldl=2;
for i=1:L
    sortCiKu(i,1)=CiKu(newIndex(i));
    newl=length(char(sortCiKu(i,1)));
    if newl>oldl
        oldl=newl;
        disp(oldl);
    end
    sortCiN(i,1)=CipepleN(newIndex(i));
end
%fHe=sum(Fsum);
%fHe=0.7*fHe;
%sum=0;
%for i=1:L
 %   sum=sum+newCif(i);
  %  if sum>fHe
   %     disp(['第 ',num2str(i),' 个位置的词']);
    %    disp(['截断频数为：',num2str(newCif(i))]);
     %   break;
    %end
%end
disp('完成');
        