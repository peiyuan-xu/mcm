%找日期
dataF=[0,117,973,1793,2536,3309,4057,4906,5650,6423,7169,7901,8659,9397,10185];
for d=1:14  %每次1天 
 lastDataIndex=(d-1)*6+1;
 %记录总数
 num=zeros(1,6);
 %记录地点值
 loca=zeros(1,6);
 %记录逮捕个数
 arrest=zeros(1,6);
 %记录国内率
 dem=zeros(1,6);
 %记录beat
 beat=zeros(1,6);
 
 first=dataF(d)+1;
 last=dataF(d+1);
for i=first:last
     %每次一个案例
     typeone=NumCrimeData{i,2};
     switch typeone
         case 'A'
             num(1)=num(1)+1;
             loca(1)=loca(1)+NumCrimeData{i,3};
             arrest(1)=arrest(1)+NumCrimeData{i,4};
             dem(1)=dem(1)+NumCrimeData{i,5};
             beat(1)=beat(1)+NumCrimeData{i,6};
         case 'B'
             num(2)=num(2)+1;
             loca(2)=loca(2)+NumCrimeData{i,3};
             arrest(2)=arrest(2)+NumCrimeData{i,4};
             dem(2)=dem(2)+NumCrimeData{i,5};
             beat(2)=beat(2)+NumCrimeData{i,6};
         case 'C'
             num(3)=num(3)+1;
             loca(3)=loca(3)+NumCrimeData{i,3};
             arrest(3)=arrest(3)+NumCrimeData{i,4};
             dem(3)=dem(3)+NumCrimeData{i,5};
             beat(3)=beat(3)+NumCrimeData{i,6};
         case 'D'
             num(4)=num(4)+1;
             loca(4)=loca(4)+NumCrimeData{i,3};
             arrest(4)=arrest(4)+NumCrimeData{i,4};
             dem(4)=dem(4)+NumCrimeData{i,5};
             beat(4)=beat(4)+NumCrimeData{i,6};
         case 'E'
             num(5)=num(5)+1;
             loca(5)=loca(5)+NumCrimeData{i,3};
             arrest(5)=arrest(5)+NumCrimeData{i,4};
             dem(5)=dem(5)+NumCrimeData{i,5};
             beat(5)=beat(5)+NumCrimeData{i,6};
         otherwise
             num(6)=num(6)+1;
             loca(6)=loca(6)+NumCrimeData{i,3};
             arrest(6)=arrest(6)+NumCrimeData{i,4};
             dem(6)=dem(6)+NumCrimeData{i,5};
             beat(6)=beat(6)+NumCrimeData{i,6};
     end
    
    
    
end
for sixi=1:6
lastData(sixi+lastDataIndex-1,:)=[num(sixi),loca(sixi)/num(sixi),arrest(sixi)/num(sixi),dem(sixi)/num(sixi),beat(sixi)/num(sixi)];
end

end





