function [trainedClassifier, validationAccuracy] = SVM_trainClassifier(trainingData,features)
%Github https://github.com/Amoiensis/Pattern_Recognition
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: SVM (SVM֧��������)
%% 
% returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train mode ls.
%
%  Input:
%      trainingData: a matrix with the same number of columns and data type
%       as imported into the app.
%
%  Output:
%      trainedClassifier: a struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: a function to make predictions on new
%       data.
%
%      validationAccuracy: a double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a matrix containing only the predictor columns used for
% training. For details, enter:
%   trainedClassifier.HowToPredict
%
% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
%% Import data
% Use dataset3
% load('dataset3.mat');
% Features = {'column_1','column_2'};
for i = 1:length(features)
    Features{i} = strcat('column_',num2str(features(i)));%{'column_1', 'column_2'};%,'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9', 'column_10'};

end
% Use dataset3 + vali_500_with_tag
% load('merge_data.mat');
% data = Merge_data;
% clear Merge_data;
%% Convert input to table
inputTable = array2table(trainingData, 'VariableNames', {'column_1', 'column_2',...
    'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9', 'column_10', 'column_11'});

predictorNames = Features;
predictors = inputTable(:, predictorNames);
response = inputTable.column_11;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false];

%% Train a classifier
% This code specifies all the classifier options and trains the classifier.
classificationSVM = fitcsvm(...
    predictors, ...
    response, ...
    'KernelFunction', 'linear', ...
    'PolynomialOrder', [], ...
    'KernelScale', 'auto', ...
    'BoxConstraint', 1, ...
    'Standardize', true, ...
    'ClassNames', [0; 1]);

% Create the result struct with predict function
predictorExtractionFcn = @(x) array2table(x, 'VariableNames', predictorNames);
svmPredictFcn = @(x) predict(classificationSVM, x);
trainedClassifier.predictFcn = @(x) svmPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.ClassificationSVM = classificationSVM;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2018b.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new predictor column matrix, X, use: \n  yfit = c.predictFcn(X) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nX must contain exactly 7 columns because this model was trained using 7 predictors. \nX must contain only predictor columns in exactly the same order and format as your training \ndata. Do not include the response column or any columns you did not import into the app. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.

%% Show the data
% % Convert input to table
% inputTable = array2table(data, 'VariableNames', {'column_1', 'column_2', 'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9', 'column_10', 'column_11'});
% 
% predictorNames = {'column_1', 'column_2', 'column_3', 'column_4', 'column_5', 'column_6', 'column_7'};
% predictors = inputTable(:, predictorNames);
% response = inputTable.column_11;
% isCategoricalPredictor = [false, false, false, false, false, false, false];

%% Cross Validation Setting
% Perform cross-validation (����Ϊ5�۽�����֤)
partitionedModel = crossval(trainedClassifier.ClassificationSVM, 'KFold', 5);

%% Predict Function
% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

%% Compute Loss
% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
