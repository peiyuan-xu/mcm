clc   %清屏
 clear  %清空变量
 close all  %关闭已打开图像

% 读入载体图像 并显示
 cover_object=imread('orign.jpg');
 if ndims(cover_object)==3  %如果是rbg图像，则转化为灰度图像
     cover_object=rgb2gray(cover_object);
 end
 figure;
 imshow(cover_object); %显示
 title('载体图像');

% 读入水印图像  并显示
 message=imread('shuiyin.jpg');
 if ndims(message)==3  %如果是rbg图像，则转化为灰度图像
     message=rgb2gray(message);
 end
 [Mm,Nm]=size(message);
 message=double(message);
 message=round(message./256); %转化为bit信息流，以便隐写
 message=uint8(message);
 figure;
 imshow(256*message); %显示
 title('待隐藏信息');

%调用yinxie函数实现信息隐写
 watermarked_image=yinxie(cover_object,message);
 figure;
 imshow(watermarked_image,[])
 title('已嵌入隐写信息的图像') %显示


%调用tiqu函数实现信息提取
 watermark=tiqu(watermarked_image,Mm,Nm);
 figure;imshow(watermark,[])%显示提取图像
 title('提取后信息')

 

