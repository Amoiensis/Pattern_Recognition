%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed: 4_SVM_QP (基于测此规划的SVM支撑向量机)
%% CLEAR
% clear;clc;
%% DATA
load('dataset3.mat');
data = data;
Feature = [1 2 3];
Featrue_plot = [1 2 3];
x_v = data(:,Feature);
y_v = data(:,11).*2-1;
C = 0.1;
%% OPERATION
close all
male = find(y_v == 1);
scatter3(x_v(male,Featrue_plot(1)),x_v(male,Featrue_plot(2)),x_v(male,Featrue_plot(3)),'r*')
hold on
female = find(y_v == -1);
scatter3(x_v(female,Featrue_plot(1)),x_v(female,Featrue_plot(2)),x_v(female,Featrue_plot(3)),'go')
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
ub = ones(NUM,1).*C;
[X,fval] = quadprog(H,f,[],[],Aeq,beq,lb,ub); %这里使用了相反数的目标函数值

w =  sum(x_v.*(X.*y_v));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  二维特殊情况，绘图
k = -w(1:end-1)/w(end);
b = 0;
b_num = 0;
gap = 0.001;
node = [x_v];

XX = [X,y_v,(1:NUM)'];
XX = sortrows(XX,1);
XX = flipud(XX);

sv_num =0;
end_num = 10;
temp1 = zeros(1,length(Feature));
temp2 = zeros(1,length(Feature));
for i=1:NUM
    if XX(i,2) == -1
        temp1 = temp1 + x_v(XX(i,3),:);
        sv_num = sv_num + 1;
        if sv_num == end_num
            break;
        end
    end
end
temp1 = temp1./end_num;

sv_num =0;
for i=1:NUM
    if XX(i,2) == 1
        temp2 = temp2 + x_v(XX(i,3),:);
        sv_num = sv_num + 1;
        if sv_num == end_num
            break;
        end
    end
end
temp2 = temp2./end_num;

mid = (temp1+temp2)/2;
mid_y = mid(end);
mid_x = mid(1:end-1);

b = mid_y - k*mid_x';

axi_x = get(gca,'Xlim');
axi_y = get(gca,'Ylim');
axi_max = max(axi_x(2),axi_y(2));
axi_min = min(axi_x(1),axi_y(1));
x_p = (axi_min:1:axi_max)';
y_p = x_p;%(axi_y(1):1:axi_y(2))';
for i=1:length(x_p)
    for j=1:length(y_p)
        z_p(i,j) = k(2)*x_p(i)+ k(1)*y_p(j)+ b;
    end
end
surf(x_p,y_p,z_p);
title(strcat('Features:',num2str(Feature)));