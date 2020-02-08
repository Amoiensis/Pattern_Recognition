%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.10.11
% Course: Pattern Recognition
% Dtailed: 1_Thresholds-Vistualize (可视化)
%% 数据导入
load('dataset3.mat');
%% 区分男女
Male_num = 1;
Female_num = 1;
Size_data = size(data);
for i=1:Size_data(1)
    if data(i,11) == 1
        Male(Male_num,:) = data(i,:);
        Male_num = Male_num+1;
    else
        Female(Female_num,:) = data(i,:);
        Female_num = Female_num+1;
    end
end
% 
for i=1:Size_data(2)
%     subplot(1,Size_data(1)+1,i);
    M_H(i) = histogram(Male(:,i));
    hold on
    F_H(i) = histogram(Female(:,i));
    figure();
end
%%
% 通过得到对象的值和分割的方法，求解交点。

for i=1:Size_data(2)
    % MALE
   Temp = M_H(i).Values;
   Male_Vlue_num(i) = M_H(i).NumBins;   %男生相关指标数目的取值
   for j=1:Male_Vlue_num(i)
       Male_Value(i,j) = Temp(j); 
   end
   Temp = M_H(i).BinEdges;
   Size_Temp = size(Temp);
   for j=1:Size_Temp(2)
       Male_Edges(i,j) = Temp(j);       %男生相关指标的区间划分
   end
   % FEMALE
      Temp = F_H(i).Values;
   Female_Vlue_num(i) = F_H(i).NumBins; %女生相关指标数目的取值
   for j=1:Female_Vlue_num(i)
       Female_Value(i,j) = Temp(j);
   end
   Temp = F_H(i).BinEdges;              
   Size_Temp = size(Temp);
   for j=1:Size_Temp(2)
       Female_Edges(i,j) = Temp(j);      %女生相关指标的区间划分
   end
end
%%
%Plot_Data
Size_Female_Edges = size(Female_Edges);
for i=1:(Size_Female_Edges(2)-1)
    Female_Mid(:,i) = (Female_Edges(:,i)+Female_Edges(:,i+1))./2;
end

Size_Male_Edges = size(Male_Edges);
for i=1:(Size_Male_Edges(2)-1)
    Male_Mid(:,i) = (Male_Edges(:,i)+Male_Edges(:,i+1))./2;
end
%%
% 直觉结论
% 看图直觉判断
% 感觉 1~5 特征具有一定的区分性

close all;