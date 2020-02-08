%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 4_SVM (SVM_支持向量机)
%% Train
load('dataset3_cut.mat');
Featrues = [1 2];
train = data(:,Featrues);
label = data(:,11);
%% Test
load('vali_500_with_tag.mat')
test_feture = vali500withtag(:,Featrues);
test_label = vali500withtag(:,11);