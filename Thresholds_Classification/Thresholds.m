%% IMFORMATION
% Author: Xiping Yu
% Email:Amoiensis@outlook.com
% Github: https://github.com/Amoiensis/Pattern_Recognition
% Data: 2019.11.02
% Course: Pattern Recognition
% Dtailed:  1_Thresholds (基于阈值判别)
%% Set Thresholds Value
Thresholds = [1 2 3 4 5];
Thresholds_value = [280 30 55 19.5 165];
Weight = [2 1 1 1 1];
Size_Thresholds = size(Thresholds);
Flag_thresholds = (Size_Thresholds(2) - mod(Size_Thresholds(2),2))/2 ;
%% Import Data
load('vali_500_with_tag.mat');
data = vali500withtag;
clear vali500withtag;
FM_flag_position = 11;
Male = 1;
Female = 0;
% Male_num = 235;
% Female_num = 411;
Male_num = length(find(data(:,11)==Male));
Female_num = length(find(data(:,11)==Female));
Size_data = size(data);
%%
% Operation
Flag = zeros(Size_data(1),Size_Thresholds(2));
for i=1:Size_data(1)
    Flag(i,:) = (data(i,Thresholds) < Thresholds_value).*Weight;
end
temp = sum(Flag')';
Result = temp > (ones(Size_data(1),1).*Flag_thresholds);
%% Check the plan
% correctness
diffrence = Result == data(:,FM_flag_position);
Correct_num = sum(diffrence);
Correctness_rate = Correct_num/Size_data(1);    %Correctness 
% FM_wrong
wrong_male_num = 0;
wrong_female_num = 0;
for i=1:Size_data(1)
   if  diffrence(i) == 0
      if data(i,FM_flag_position) == Male
          wrong_male_num = wrong_male_num +1;
      else
          wrong_female_num = wrong_female_num+1;
      end
   end
end
wrong_male_rate = wrong_male_num/Male_num;      %wrong_male_rate
wrong_female_rate = wrong_female_num/Female_num;%wrong_female_rate
wrong_all = (wrong_female_num+wrong_male_num)/(Male_num+Female_num);
