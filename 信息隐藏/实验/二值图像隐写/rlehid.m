clc; clear all 
I=imread('lena.bmp'); 
if(length(size(I))==3)   
    I=rgb2gray(I); 
end 
[row,col]=size(I); 
Ibw=im2bw(I); 
oi=Ibw(:); 
len=size(oi); 
i=1; j=1; 
%% 将载体图像转换
while i<len(1)    
    or=oi(i);     
    count=1; 
    while (i<len(1)&&oi(i+1,1)==or)        
        i=i+1; 
        count=count+1;     
    end 
    RLE(j)=count;%RLE为游程   
    j=j+1;     
    i=i+1; 
end 
if  i==len(1)     
    RLE(j)=1;
end
RLE=RLE';

%% 读取秘密信息，并转换为比特流
msgfid=fopen('hidden.txt','r');
[msg,msgcount]=fread(msgfid); 
fclose(msgfid); 
%
msg=uint8(dec2bin(msg)-48); 
[htxt,ltxt]=size(msg); 
mmsg=zeros(htxt,8); 
if(ltxt<8)    
    n=8-ltxt; 
    mm=zeros(htxt,n);     
    for i=1:htxt 
        mmsg(i,:)=[mm(i,:),msg(i,:)];    
    end
end
msg=mmsg'; 
msgcount=msgcount*8;  

%% 秘密信息比特位嵌入
for l=1:msgcount    
    modpoint=0;    
    for x=1:2*l 
        modpoint=modpoint+RLE(x,1);     
    end 
    if msg(l)==0 
        if ((mod(RLE(2*l),2)~=0)&&(RLE(2*l+1)~=1)) 
            oi(modpoint+1,1)=mod((oi(modpoint+1,1)+1),2); 
        else if ((mod(RLE(2*l),2)~=0)&&(RLE(2*l+1)==1))&&(RLE(2*l)~=1)            
                oi(modpoint,1)=mod((oi(modpoint,1)+1),2);         
            end
        end
    else
        if ((mod(RLE(2*l),2)==0)&&(RLE(2*l+1)~=1)) 
            oi(modpoint+1,1)=mod((oi(modpoint+1,1)+1),2); 
        else if ((mod(RLE(2*l),2)==0)&&(RLE(2*l+1)==1))&&(RLE(2*l)~=1)    
                oi(modpoint,1)=mod((oi(modpoint,1)+1),2);          
            end
        end
    end
end
%m1=Vector2Matrix(oi,row,length(oi)/row); 
m1=reshape(oi,row,length(oi)/row);
m1=m1';
m1=m1'; 
imwrite(m1,'marked.bmp');
figure 
subplot(1,2,1);imshow(Ibw);title('原始二值图像'); 
subplot(1,2,2);imshow('marked.bmp');title('加密后的图像');