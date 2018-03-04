function [] = plotDong(wen)
%% 只能具体表示温度线性变化，无波动的空间温度分布
%传入不同季节的温度平衡后的温度分布，画出由于季节变化图像的更新
[m,n]=size(wen);
for i=1:n  %每一列画一个图，依次更新
    W=wen(:,i);
    meshThree(W);
    pause(1);
    hold off;
    drawnow;
end


end

