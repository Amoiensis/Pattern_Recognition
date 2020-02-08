%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 2_Bayes (BayesÅÐ±ð)
%% Import data
% Use dataset3
load('dataset3.mat');
% Use dataset3 + vali_500_with_tag
load('merge_data.mat');
data = Merge_data;
clear Merge_data;
%% Train Model
Mean = mean(data(:,1:10));
Cov = cov(data(:,1:10));
nb_model = fitcnb(data(:,1:7), data(:,11));
% Predict
% load('vali_500_with_tag.mat')
% value = nb_model.predict(vali500withtag(:,1:5));