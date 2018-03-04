function f=fitness(a)

yuan=[1	25	85	20	8	184	38.07886553	1
2	22	75	30	7	134	30.8058436	2
3	22	85	10	5	148	39.35733731	3
22	40	15	40	9	109	35	4
24	38	15	10	7	157	35.05709629	5
38	60	80	10	6	191	36.05551275	6
40	58	75	20	10	136	30.8058436	7
41	55	80	10	10	112	33.54101966	8
42	55	85	20	10	118	38.07886553	9
43	55	82	10	8	114	35.34119409	10
50	25	30	3	5	183	25	11
52	55	60	16	7	100	18.02775638	12
53	30	60	16	8	132	14.14213562	13
54	50	35	19	6	154	18.02775638	14
55	30	25	23	6	192	26.92582404	15
59	45	65	9	5	112	15.8113883	16
62	45	30	17	8	184	20.61552813	17
63	35	40	16	8	149	11.18033989	18
64	41	37	16	9	187	13.03840481	19
66	40	60	21	9	124	10	20
67	31	52	27	6	109	9.219544457	21
68	35	69	23	7	171	19.6468827	22
78	47	47	13	8	127	7.615773106	23
79	49	58	10	9	101	12.04159458	24
80	27	43	9	8	168	14.76482306	25
81	37	31	14	9	138	19.23538406	26
86	24	58	19	5	186	17.88854382	27
88	37	47	6	6	178	4.242640687	28
89	49	42	13	7	160	12.04159458	29
90	53	43	14	10	114	14.76482306	30
91	61	52	3	7	152	21.09502311	31
92	57	48	23	10	125	17.11724277	32
93	56	37	6	9	113	20.61552813	33
94	55	54	26	7	192	15.5241747	34
96	26	52	9	8	163	14.14213562	35
97	26	35	15	8	125	20.51828453	36
98	31	67	3	8	195	19.23538406	37];
for i=1:37
    for j=1:37
        if yuan(j,8)==a(i)
            b(i,:)=yuan(j,:);
        end
    end
end
t=120;
k=0;
l=zeros(37,1);
l(1)=sqrt((b(1,2)-40)^2+(b(1,3)-50)^2);
xht=zeros(37,1);
xht(1)=b(1,5);
p=0;
for i=2:35
    if(i==p)
        continue
    end
    t=t-b(i,4);
    if t==0
        k=k+1;
        q=0;
        d(k,:)=[i+1,b(i+1,1)];
        l(i)=l(i-1)+sqrt((b(i-1,2)-b(i,2))^2+(b(i-1,3)-b(i,3))^2);
        zl(k)=l(i)+sqrt((b(i+1,2)-40)^2+(b(i+1,3)-50)^2);%每趟总路程
        l(i+1)=sqrt((b(i+1,2)-40)^2+(b(i+1,3)-50)^2);
        xht(i)=xht(i-1)+b(i,5);
        xht(i+1)=xht(i)+t*b(i+1,5)/b(i+1,4);
        tt(k)=xht(i+1);%每趟总卸货时间
        xht(i+1)=(b(i+1,4)-t)*b(i+1,5)/b(i+1,4);
        t=120-b(i+1,4)+t;
        p=i+1;
        i=i+2;
    end
    if i>36
        break
    end
    if t>0 && t<b(i+1,4)
        k=k+1;
        d(k,:)=[i+1,b(i+1,1)];
        l(i)=l(i-1)+sqrt((b(i-1,2)-b(i,2))^2+(b(i-1,3)-b(i,3))^2);
        l(i+1)=l(i)+sqrt((b(i+1,2)-b(i,2))^2+(b(i+1,3)-b(i,3))^2);
        zl(k)=l(i+1)+sqrt((b(i+1,2)-40)^2+(b(i+1,3)-50)^2);%每趟总路程
        l(i+1)=sqrt((b(i+1,2)-40)^2+(b(i+1,3)-50)^2);
        xht(i)=xht(i-1)+b(i,5);
        xht(i+1)=xht(i)+t*b(i+1,5)/b(i+1,4);
        tt(k)=xht(i+1);%每趟总卸货时间
        xht(i+1)=(b(i+1,4)-t)*b(i+1,5)/b(i+1,4);
        t=120-b(i+1,4)+t;
        p=i+1;
        i=i+2;
    end
        l(i)=l(i-1)+sqrt((b(i,2)-b(i-1,2))^2+(b(i,3)-b(i-1,3))^2);
        xht(i)=xht(i-1)+b(i,5);%卸货时间
end
if b(37,4)>t
    d(k+1,:)=[37,b(37,1)];
    zl(k+1)=l(36)+sqrt((b(37,2)-40)^2+(b(37,3)-50)^2)+sqrt((b(37,2)-b(36,2))^2+(b(37,3)-b(36,3))^2);
    l(37)=2*sqrt((b(37,2)-40)^2+(b(37,3)-50)^2);
    zl(k+2)=2*sqrt((b(37,2)-40)^2+(b(37,3)-50)^2);
    tt(k+1)=xht(36)+t*b(i+1,5)/b(i+1,4);
    xht(29)=(b(37,4)-t)*b(37,5)/b(37,4);
    tt(k+2)=(b(37,4)-t)*b(37,5)/b(37,4);
end

d(k+1,:)=[37,b(37,1)];
zl(k+1)=l(36)+sqrt((b(37,2)-b(37-1,2))^2+(b(37,3)-b(37-1,3))^2);
l(37)=sqrt((b(37,2)-b(37-1,2))^2+(b(37,3)-b(37-1,3))^2);
tt(k+1)=xht(36)+b(37,5);
xht(32)=xht(36)+b(37,5);
for i=1:k+1
    zt(i)=(1/5.2)*zl(i)+tt(i);%每趟总时间
end
dt(1,:)=[1,b(1,1),(1/5.2)*l(1)];
for i=2:37
    dt(i,:)=[i,b(i,1),(1/5.2)*l(i)+xht(i-1)];
    if i==d(:,1)
        dt(i,:)=[i,b(i,1),max(zt(i)-(1/5.2)*sqrt((b(i,40)-2)^2+(b(i,3)-50)^2),(1/5.2)*l(i)+xht(i-1))];
    end
end
zl=sum(zl);
for i=1:37
    a(i)=max(dt(i,3)-b(i,6),0);
end
m=1000000;
f=m*sum(a)+zl*9;

end
