%（后于fenleiAnd）调用了调整因子 a b c 的函数%计算  每个分类的总和，与库存对比
xuA=ad;
la=length(ad);
sumdemand=0;
for i=1:la
    indexa=xuA(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['A类 共需要：',num2str(sumdemand)]);

xuB=bd;
la=length(bd);
sumdemand=0;
for i=1:la
    indexa=xuB(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['B类 共需要：',num2str(sumdemand)]);

xuC=cd;
la=length(cd);
sumdemand=0;
for i=1:la
    indexa=xuC(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['C类 共需要：',num2str(sumdemand)]);