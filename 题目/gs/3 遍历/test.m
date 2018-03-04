%% 遍历
%赤纬角 -23.5:23.5
Fitness1=zeros(181,361,48);
wnum=1;jnum=1;knum=1;

tXu=t3;
ty=trueyL3;
for w=90:-1:-90
    jnum=1;
    for j=180:-1:-180
        knum=1;
        for k=-23.5:1:23.5
         position=[w,j,k];
         f= fitness(position ,ty,tXu);
         Fitness1(wnum,jnum,knum)=f;
         knum=knum+1;
        end
        
        jnum=jnum+1;
    end
    wnum=wnum+1;
end
%[Xw,Yj]=meshgrid(180:-1:-180,90:-1:-90);
%mesh(Xw,Yj,Fitness1);
%xlabel('经度');ylabel('纬度');zlabel('适应度值');
    