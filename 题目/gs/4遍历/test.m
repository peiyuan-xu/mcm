%% 遍历
Fitness1=zeros(181,361);
wnum=1;jnum=1;
for w=90:-1:-90
    jnum=1;
    for j=180:-1:-180
        position=[w,j];
         f= fitness(position );
         Fitness1(wnum,jnum)=f;
         jnum=jnum+1;
    end
    wnum=wnum+1;
end
[Xw,Yj]=meshgrid(180:-1:-180,90:-1:-90);
mesh(Xw,Yj,Fitness1);
xlabel('经度');ylabel('纬度');zlabel('适应度值');
    