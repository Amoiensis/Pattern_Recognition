%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 4_SVM_QP (基于测此规划的SVM支撑向量机)
%% Data
load('dataset3.mat');
data = data;
Feature = [1 2];
x_v = data(:,Feature);
y_v = data(:,11).*2-1;
C = 0.1;

load('vali_500_with_tag.mat');
data = vali500withtag;
Feature = [1 2];
x_v = data(:,Feature);
y_v = data(:,11).*2-1;
C = 0.1;
%% OPERATION
close all
male = find(y_v == 1);
plot(x_v(male,1),x_v(male,2),'r*')
hold on
female = find(y_v == -1);
plot(x_v(female,1),x_v(female,2),'go')
% plot(x_v,y_v,'g*');


Size_sample = size(x_v);
NUM = Size_sample(1);
x = sym('x',[NUM,1]);

G = ones(NUM)./2 + eye(NUM)./2;
K = triu(ones(NUM));

H = G.*(y_v*y_v').*(x_v*x_v');
KK = eig(H);
f = -ones(NUM,1);
Aeq = y_v';
beq = zeros(1,1);
lb = zeros(NUM,1);
% ub = ones(NUM,1).*0.001;
ub = ones(NUM,1).*C;
% [X,fval] = quadprog(H,f,[],[],Aeq,beq,lb,[]); %这里使用了相反数的目标函数值
[X,fval] = quadprog(H,f,[],[],Aeq,beq,lb,ub); %这里使用了相反数的目标函数值

w =  sum(x_v.*(X.*y_v));
%%  二维特殊情况，绘图
k = -w(2)/w(1);
b = 0;
b_num = 0;
gap = 0.001;
node = [x_v];
% Low = mean(X);
% for i=1:NUM
%     %if (X(i)<C) & (X(i)>=Low)
%         b = b +  (1/y_v(i) - w*x_v(i,:)');
%         b_num = b_num +1;
% %         break;
%    % end
% end
% 
% b = b/b_num;


XX = [X,y_v,(1:NUM)'];
XX = sortrows(XX,1);
XX = flipud(XX);

for i=1:NUM
    if XX(i,2) == -1
        temp1 = x_v(XX(i,3),:);
        break;
    end
end

for i=1:NUM
    if XX(i,2) == 1
        temp2 = x_v(XX(i,3),:);
        break;
    end
end

mid_y = (temp1(2)+temp2(2))/2;
mid_x = (temp1(1)+temp2(1))/2;

b = mid_y - k*mid_x;

axi_x = get(gca,'Xlim');
x_p = axi_x(1):1:axi_x(2);
y_p = x_p.*k + b;
plot(x_p,y_p);
title(strcat('Features:',num2str(Feature)));