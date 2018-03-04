clc; 
clear all; 
oi=imread('marked.bmp');%打开携密图像
[row col ]=size(oi); 
oi=oi(:); 
len=size(oi);
i=1; j=1; 
while (i< len(1))  
    or=oi(i);  
    count=1; 
  while(i<len(1)&&oi(i+1)==or)    
      i=i+1; 
    count=count+1;  
  end 
 RLE(j)=count;
 j=j+1;
 i=i+1; 
end 
if i==len(1)   
    RLE(j)=1;
end 
RLE=RLE';
msgcount=96;   %必须知道水印的长度 
for i=1:msgcount   
    msg(i,1)=0;
end 
for l=1:msgcount 
if mod(RLE((2*l),1),2)==0 
  msg(l,1)=0       %如果游程的值为偶数，表示隐藏的信息为0 
else 
  msg(l,1)=1       %如果游程的值为奇数，表示隐藏的信息为1 
end
end;
%ot=Vector2Matrix(msg,msgcount/8);
ot=reshape(msg,8,msgcount/8);
ot=ot';
ot=int2str(ot);
out=bin2dec(ot);

%out=bit2num(ot);
fid=fopen('message.txt','wt'); 
fwrite(fid,out);
fclose(fid); 