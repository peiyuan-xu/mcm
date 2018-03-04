A=imread('E:\MATLAB程序\练习代码\图像处理\images\1.bmp');
subplot(2,2,1);
imshow(A);
title('原图像');

Ai=rgb2gray(A);
subplot(2,2,2);
imshow(Ai);
title('灰度图像');

An=im2bw(Ai,0.555);
subplot(2,2,3);
imshow(An);
title('二值图象');


