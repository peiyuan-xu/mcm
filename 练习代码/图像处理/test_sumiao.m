clc,clear;

sFileFullName='\images\1.bmp';
imagesfilename = textread(sFileFullName,'%s');
imagename=char(imagesfilename(1));
A=imread(imagename);
imshow(A);