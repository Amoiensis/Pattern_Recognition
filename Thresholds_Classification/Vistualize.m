%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.10.11
% Course: Pattern Recognition
% Dtailed: 1_Thresholds-Vistualize (���ӻ�)
%% ���ݵ���
load('dataset3.mat');
%% ������Ů
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
% ͨ���õ������ֵ�ͷָ�ķ�������⽻�㡣

for i=1:Size_data(2)
    % MALE
   Temp = M_H(i).Values;
   Male_Vlue_num(i) = M_H(i).NumBins;   %�������ָ����Ŀ��ȡֵ
   for j=1:Male_Vlue_num(i)
       Male_Value(i,j) = Temp(j); 
   end
   Temp = M_H(i).BinEdges;
   Size_Temp = size(Temp);
   for j=1:Size_Temp(2)
       Male_Edges(i,j) = Temp(j);       %�������ָ������仮��
   end
   % FEMALE
      Temp = F_H(i).Values;
   Female_Vlue_num(i) = F_H(i).NumBins; %Ů�����ָ����Ŀ��ȡֵ
   for j=1:Female_Vlue_num(i)
       Female_Value(i,j) = Temp(j);
   end
   Temp = F_H(i).BinEdges;              
   Size_Temp = size(Temp);
   for j=1:Size_Temp(2)
       Female_Edges(i,j) = Temp(j);      %Ů�����ָ������仮��
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
% ֱ������
% ��ͼֱ���ж�
% �о� 1~5 ��������һ����������

close all;