%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 4_SVM (SVM_支持向量机)
%% DATA_Operation
load('vali_500_with_tag.mat');
Featrues = 1:10;%[1 2];
Train_num = 1;  % 1:dataset3 0:20个数据
x1 = vali500withtag(:,Featrues);
% x1 = data(:,1:10);
if length(Featrues) == 10
    if Train_num == 1
        Value = myAll_10_NeuralNetworkFunction(x1);
    else
        Value = my20_10_NeuralNetworkFunction(x1);  
    end
else
    if Train_num == 1
        Value = myAll_2_12_NeuralNetworkFunction(x1);
    else
        Value = my20_2_12_NeuralNetworkFunction(x1);
    end
end
Size_Value = size(Value);
for i=1:Size_Value(1)
    if Value(i) >= 0.5
        Predict_value(i) = 1;
    else
        Predict_value(i) = 0;
    end
end
Predict_value = Predict_value';
%% Estimate result
Estimate_result