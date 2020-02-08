%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 2_Bayes (Bayes判别)
%% Clear
clear;
%% Import data
% train
% dataset3
% load('dataset3.mat');
% part of dataset3
% Male_num = 10;
% Female_num = 10;
% Random = 1; % 是否随机抽取
% data = data_cut(Male_num,Female_num,Random);
load('dataset3.mat');
% test 
load('vali_500_with_tag.mat');
test = vali500withtag;
clear vali500withtag;
%% Setting
Featrues = [1 2];%1:10;
%% Predict
% Predict_value = nb_model.predict(test(:,1:7));
Predict_value = Predict_Bayes(data,test(:,Featrues),Featrues);
%% Estimate result
Female = 1;
Male = 0;
num_Female = length(find(test == Female));
num_Male = length(find(test == Male));
Error = test(:,11) - Predict_value;
Error_female2male = 1;
Error_male2female = -1;
right = 0;
Pridict_num = length(Predict_value);
Predict_error_female2male = length(find(Error == Error_female2male));
Predict_error_male2female = length(find(Error == Error_male2female));
Predict_right = length(find(Error == right));
%% Compute indicator
Wrong_male = Predict_error_male2female/num_Male;
Wrong_female = Predict_error_female2male/num_Female;
Wrong_all = (Predict_error_male2female+Predict_error_female2male)/(num_Male+num_Female);