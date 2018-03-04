function [ flag ] = judege_feasibility( machine,X,Y,minHorizon )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
Y_max=2350;
if ( machine(1)<=X(minHorizon) && ( machine(2)<=Y_max-Y(minHorizon)) )
    flag=1;
else
    flag=0;
end

