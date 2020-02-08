%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 4_SVM_QP (基于测此规划的SVM支撑向量机)
%% Import data
save myfile k b;
clear all;
load myfile;
load('vali_500_with_tag.mat');
test = vali500withtag;
% clear vali500withtag;
Features = [1 2];
%% Predict
Size_test = size(test);
Predict_value = ones(Size_test(1),1);
for i=1:Size_test(1)
    temp = test(i,Features(1:end-1))*k+b-test(i,Features(end));
    temp = sign(k)*temp;
    if temp < 0
        Predict_value(i) = 1;
    else
        Predict_value(i) = 0;
    end
end
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
%% Plot
% Test data
figure();
x_v = test(:,Features);
y_v = test(:,11).*2-1;
male = find(y_v == 1);
plot(x_v(male,1),x_v(male,2),'b*')
hold on
female = find(y_v == -1);
plot(x_v(female,1),x_v(female,2),'go')
% Line
axi_x = get(gca,'Xlim');
x_p = axi_x(1):1:axi_x(2);
y_p = x_p.*k + b;
plot(x_p,y_p);
title(strcat('Features:',num2str(Features)));