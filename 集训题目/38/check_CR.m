function y = check_CR( CR,CI )
%对CR进行检验
if CR<0.10
    disp('此矩阵的一致性可以接受!');
    disp('CI=');disp(CI);
    disp('CR=');disp(CR);
else disp('此矩阵的一致性验证失败，请重新进行评分!');
    disp('！！CI=');disp(CI);
    disp('！！CR=');disp(CR);
end


end

