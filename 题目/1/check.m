
%检查两个矩阵是否一致
for i=1:58
    for j=1:58
        if Dis1(i,j)~=Dis2(i,j)
            if i>=1&&i<=8
                if j>=1&&j<=8
                    disp(['基地',num2str(i),'到基地',num2str(j),'出现问题']);
                elseif  j>=9 && j<=43
                    disp(['基地',num2str(i),'到销售点',num2str(j-8),'出现问题']);
                else j>=44&&j<=58
                       disp(['基地',num2str(i),'到路口',num2str(j-43),'出现问题']);
                end
            elseif   i>=9&&i<=43
              if j>=1&&j<=8
                    disp(['销售点',num2str(i-8),'到基地',num2str(j),'出现问题']);
              elseif j>=9&&j<=43
                    disp(['销售点',num2str(i-8),'到销售点',num2str(j-8),'出现问题']);
                else j>=44&&j<=58
                       disp(['销售点',num2str(i-8),'到路口',num2str(j-43),'出现问题']);
              end
            else  i>=44&&i<=58
                if j>=1&&j<=8
                    disp(['路口',num2str(i-43),'到基地',num2str(j),'出现问题']);
                elseif  j>=9&&j<=43
                   
                    disp(['路口',num2str(i-43),'到销售点',num2str(j-8),'出现问题']);
                else j>=44&&j<=58
                       disp(['路口',num2str(i-43),'到路口',num2str(j-43),'出现问题']);
                end
            end
            
        end
    end
    end
    