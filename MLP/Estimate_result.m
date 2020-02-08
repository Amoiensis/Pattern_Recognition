%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 4_SVM (SVM_支持向量机)
%% Import data
load('vali_500_with_tag.mat');
test = vali500withtag;
% clear vali500withtag;
%% Predict
% Predict_value = ans.predictFcn(test(:,1:7));
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