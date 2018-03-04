function [ place ] = find_MinHorizon( height_array )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[~,y_place]=find(height_array==min(height_array));
 place=y_place(1);
end

