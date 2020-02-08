%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 2_Naive_Bayes (ÆÓËØ±´Ò¶Ë¹ÅÐ±ð)
%% Import data
% Use dataset3
% load('dataset3_cut.mat');
load('dataset3.mat');
% Use dataset3 + vali_500_with_tag
% load('merge_data.mat');
% data = Merge_data;
% clear Merge_data;
Features = [1 3];
%% Train Model
nb_model = fitcnb(data(:,Features), data(:,11));
% Predict
% load('vali_500_with_tag.mat')
% value = nb_model.predict(vali500withtag(:,1:5));