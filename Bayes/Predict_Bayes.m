function [predict_label] = Predict_Bayes(train_dataset,Test,Featrues)
%Predict_Bayes Bayes Classifier--Github https://github.com/Amoiensis/Pattern_Recognition
%   此处显示详细说明
%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 2_Bayes (Bayes判别)
%% Import data
% Use dataset3
% load('dataset3.mat');
data = train_dataset;
% Use dataset3 + vali_500_with_tag
% load('merge_data.mat');
% data = Merge_data;
% clear Merge_data;
%% Pretreatment
Size_test = size(Test);
predict_num = Size_test(1);
predict_label = zeros(predict_num,1);
Male = 0;
Female = 1;
data_male = data(find(data(:,11)==Male),:);
data_female = data(find(data(:,11)==Female),:);
%% Train Model
% Male
Mean_male = mean(data_male(:,Featrues));
Cov_male  = cov(data_male(:,Featrues));
Size_Cov_male = size(Cov_male);
d_male = Size_Cov_male(1);
inv_Cov_male = inv(Cov_male);
% Female
Mean_female = mean(data_female(:,Featrues));
Cov_female  = cov(data_female(:,Featrues));
Size_Cov_female = size(Cov_female);
d_female = Size_Cov_female(1);
inv_Cov_female = inv(Cov_female);
%% Predict
for i=1:predict_num
    test = Test(i,:);
    temp_value_male = -((test-Mean_male)*inv_Cov_male*(test-Mean_male)')./2-d_male/2*log(2)-log(det(Cov_male))+log(0.5);
    temp_value_female = -((test-Mean_female)*inv_Cov_female*(test-Mean_female)')./2-d_female/2*log(2)-log(det(Cov_female))+log(0.5);
    if temp_value_male >= temp_value_female
        predict_label(i) = 0;
    else
        predict_label(i) = 1;
    end
end
end

