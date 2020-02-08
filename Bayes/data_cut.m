function [part_data] = data_cut(Male_num,Female_num,Random)
%Github https://github.com/Amoiensis/Pattern_Recognition
%%
% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 2_Bayes-Data Cut (Bayes判别)
%% Seting
% Male_num = 10;
% Female_num = 10;
% Random = 1; % 是否随机抽取
%% 
load('dataset3.mat')
Male = 0;
Female = 1;
data_male = data(find(data(:,11)==Male),:);
Size_male = size(data_male);
data_female = data(find(data(:,11)==Female),:);
Size_female = size(data_female);
clear data;
rng('default');
rng('shuffle') 
Sampling_matrix_male = [(1:Size_male(1))',rand(Size_male(1),1)];
rng('shuffle') 
Sampling_matrix_female = [(1:Size_female(1))',rand(Size_female(1),1)];
if Random == 1
    sortrows(Sampling_matrix_male,2);
    sortrows(Sampling_matrix_female,2);
end
data = [data_female(Sampling_matrix_female(1:Female_num,1),:);data_male(Sampling_matrix_male(1:Male_num,1),:)];
save('dataset3_cut.mat','data');
part_data = data;
end