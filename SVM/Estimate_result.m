%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: SVM (SVM支撑向量机)
%% Import data
load('vali_500_with_tag.mat');
test = vali500withtag;
clear vali500withtag;
Features = [2 3 6 4 7 10]; % 设置选用特征 1：10 / [1 2]
plot_features = [1 2];  % 绘制所选特征中哪几个
%% Train
load('dataset3.mat');
features = Features;%[1 4];
[trainedClassifier, validationAccuracy]= SVM_trainClassifier(data(:,1:11),features);
%% Predict
SVM = trainedClassifier;
Beta = SVM.ClassificationSVM.Beta;
Vector_suport = find(SVM.ClassificationSVM.IsSupportVector);
Vector_suport_mtrix = data(Vector_suport,features);
% bais = (1./SVM.ClassificationSVM.SupportVectorLabels - Vector_suport_mtrix*Beta);
% bais = (1./SVM.ClassificationSVM.SupportVectorLabels - sum((Vector_suport_mtrix.*SVM.ClassificationSVM.SupportVectors)')');
% bais = (SVM.ClassificationSVM.Bias*prod(trainedClassifier.ClassificationSVM.Sigma)-trainedClassifier.ClassificationSVM.Mu*Beta);
k = -(Beta(plot_features(2))./Beta(plot_features(1)));
bais = Vector_suport_mtrix(:,1) - Vector_suport_mtrix(:,2).*k;
Bias = mean(bais);
Predict_value = SVM.predictFcn(test(:,Features));
%% Plot
% if length(features) == 2
    Female = 1;
    Male = 0;
    node_female = find(test(:,11) == Female);
    plot(test(node_female,Features(plot_features(2))),test(node_female,Features(plot_features(1))),'r*');
    hold on;
    node_male = find(test(:,11) == Male);
    plot(test(node_male,Features(plot_features(2))),test(node_male,Features(plot_features(1))),'g*');
    hold on;
    axi_x = get(gca,'Xlim');
    axis_y = get(gca,'Ylim');
    plot_x =linspace(axi_x(1),axi_x(2));
    plot_y = plot_x.*k + Bias;
    plot (plot_x,plot_y,'b-');
% end
%% Estimate result
num_Female = length(node_female);
num_Male = length(node_male);
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