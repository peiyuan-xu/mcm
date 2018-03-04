clc,clear
%a 为剩余量，x 车的数量9
k=0;
z=[];
for ax=0:5 %a基地运量120的车数
    for bx=5:0 %b基地运量120的车数
        for m=0:5 %a基地运量150的车数
            for n=5:0 %b基地运量150的车数
                for a=0:76 %a基地剩余量
                    for b=76:0 %b基地剩余量
                p=660-120*x-150*m-a;%a基地第一次运送后的剩余量
                q=550-120*y-150*n-b; %b
                w=620-120*(5-x-y)-150*(5-m-n)-(76-a-b); %c
                if (p>120&&m>0)||(x==0)
                    e=ceil(p/150);
                else
                    e=ceil(p/120);
                end
                if (q>120&&n>0)||(y==0)
                    f=ceil(q/150);
                else
                    f=ceil(q/120);
                end
                if (w>120&&(5-m-n)>0)||(5-x-y==0)
                    g=ceil(w/150);
                else
                    g=ceil(w/120);
                end
                k=k+1;
                z(k)=e+f+g;
                    end
                end
            end
        end
    end
end
h=min(z)              
                    
