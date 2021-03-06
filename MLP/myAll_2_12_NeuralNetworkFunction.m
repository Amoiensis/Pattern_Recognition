function [y1] = myAll_2_12_NeuralNetworkFunction(x1)
%Github https://github.com/Amoiensis/Pattern_Recognition
%MYNEURALNETWORKFUNCTION neural network simulation function.
%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 4_SVM (SVM_支持向量机)
%%
%
% Auto-generated by MATLAB, 13-Dec-2019 10:30:45.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx2 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [225;16];
x1_step1.gain = [0.0132135306553911;0.0142602495543672];
x1_step1.ymin = -1;

% Layer 1
b1 = [4.4289412844900475363;3.4409945103496912822;2.4572181873330509738;1.4935343293707827872;0.30195078505968320215;-0.59479233264674413739;2.1770954522899601535;-3.4287435094840068572;3.3124019745064479103;4.4271864725558467413];
IW1_1 = [-3.8391696478441628138 2.2002644198633141137;-4.0145791644411783494 1.8707361046462076537;-0.11775609569021580625 -4.4258289222076365732;-2.9771097579216094786 -3.2745299870694402067;-2.7708315444115174664 3.5337938703472069335;-3.8154948841585532016 -2.2111225045728475358;1.9470695655525773748 3.6022126814064101552;-2.4646873601557413025 -3.0133771473854320533;1.17553918879878605 4.3539566883084201976;2.9810826692902057111 -3.2730936163565651498];

% Layer 2
b2 = -0.10534992901072820493;
LW2_1 = [-0.49752984505807762439 0.1770686351377759038 1.0809246498498545908 -0.77508145198249100982 1.3289732467141637251 0.87993980664268800496 -1.8366630643998163031 2.1155748560527536384 -0.89010243136677735798 0.077251819547833305846];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = logsig_apply(repmat(b2,1,Q) + LW2_1*a1);

% Output 1
y1 = a2;
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Positive Transfer Function
function a = logsig_apply(n,~)
a = 1 ./ (1 + exp(-n));
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end
