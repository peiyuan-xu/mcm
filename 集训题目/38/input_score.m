function [  ] = input_score()
% 输入各个学院的没门科目的成绩，计算出权重矩阵
%score=input('输入成绩表：');
%[m,n]=size(score);
m=4;
n=7;
for i=1:m   %每次循环生成一个7*7的权重矩阵
    score=input('输入单独学科成绩表：');
   for j=1:n
       for k=1:n
           score_pan(j,k)=score(1,j)/score(1,k);
       end
   end
disp(['第',num2str(i),' 个权重矩阵为：']);disp(score_pan);
end

end

