% 初始化生成变量
%结果：B I J
clc,clear;
snode=[1 1 1 2 2 3 4 4 5 5 5 5 6 7];
enode=[3 2 4 5 4 5 6 7 8 7 6 6 10 9];
time=[5 10 11 0 4 4 15 0 35 0 21 25 15 20];

keyroad( snode,enode,time )