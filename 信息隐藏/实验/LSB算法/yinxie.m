function watermarked_image=yinxie(cover_object,message)
 % 获取载体图像的大小
 [Mc,Nc]=size(cover_object);
 % 获取水印图像的大小
 [Mm,Nm]=size(message);
 length_message=Mm*Nm;%信息长度
 message(Mc,Nc)=0;
 watermarked_image=cover_object;


 %每一比特秘密信息都用载体图像的一个像素负载，如果秘密比特与像素灰度
 %值的最低位相同，则不作修改；否则，若原始灰度值为奇数，则减1，若为
 %偶数，则加1

 

% mod(cover_object(ii,jj),2)   获取图像cover_object处像素值的最低位

for ii = 1:Mc
     for jj = 1:Nc
         if mod(cover_object(ii,jj),2)==message(ii,jj)%判断是否相等
             continue; %若相等，不作修改
         else %否则
             if mod(cover_object(ii,jj),2)==0 %若为偶，则加1
                 watermarked_image(ii,jj)=cover_object(ii,jj)+1;
             else %若为奇，则减1
                 watermarked_image(ii,jj)=cover_object(ii,jj)-1;
             end
         end
     end
 end

