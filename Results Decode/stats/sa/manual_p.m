% Calculate all variables for the p-value
clc;
x1 = A_q(1,:);
x2 = B_q(1,:);

n1 = length(x1);
n2 = length(x2);

% Standard Deviation
s1 = std(x1);
s2 = std(x2);


% Pool standard deviation
s12 = sqrt((((n1-1)*s1^2) + ((n2-1)*s2^2))/(n1+n2-2));

% Mean
x1m = mean(x1);
x2m = mean(x2);

xS = sum(x1-x1m);
s1_ = sqrt(sum(abs(x1-x1m).^2)/(n1-1));

% Hypothosised difference between mean
d = 0;

% Standard Error (Estimate of SD
se = sqrt((s1^2/n1) + (s2^2/n2));
% Standard Deviation Pool
se_p = sqrt((s12^2/n1) + (s12^2/n2));

% Degrees of freedom
DF = ceil(((((s1^2)/n1)+((s2^2)/n2))^2) / (((((s1^2)/n1)^2)/(n1 - 1)) + ((s2^2/n2)^2/(n2 - 1))));

% Test statistic (same as ttest2 function)
t = ((x1m-x2m)-d)/se_p;

% MATLAB function test ('left' sided test gives same results as manual function {when using online p-value calculator})
[h,p,ci,stats] = ttest2(x1,x2,0.1,'left',[]);


tableArray{1,2} = 'Manual';
tableArray{1,3} = 'Function';
tableArray{2,1} = 'p-value';
tableArray{3,1} = 'Test Statistic';
tableArray{4,1} = 'DF';
tableArray{5,1} = 'SD Pool';

tableArray{2,2} = num2str(0.3814);
tableArray{2,3} = num2str(p);

tableArray{3,2} = num2str(t);
tableArray{3,3} = num2str(stats.tstat);

tableArray{4,2} = num2str(DF);
tableArray{4,3} = num2str(stats.df);

tableArray{5,2} = num2str(s12);
tableArray{5,3} = num2str(stats.sd);