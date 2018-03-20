%% Average across SA questions and for each microphone

% Position A (participants per mic)

% All data
A_u = cell2mat(hash_xlRaw(:,3:6,2:20));
% Mic data avereaged across SA
A = squeeze(sum(A_u,2)/4);
% Create long list of all participant results for A and B
% par = 38, q = 4, mics = 7 Total = 1064
%Alist = zeros(1,812);
Alist = A_u(:);
% B Data
B_u = permute(cell2mat(sortedArray(:,:,2:5)),[1 3 2]);
Blist = B_u(:);

% Test the variance
vA = var(Alist);
vB = var(Blist);

% Test for a normal distribution
adA = adtest(Alist);
adB = adtest(Blist);

vt = vartest(Blist,vA);

% Statistical Significants
[h,p,ci,stats] = ttest2(Alist,Blist,'vartype','unequal');

%% Plot distribution for each question
close all

fit = 'normal';
h1 = histfit(Alist,[],fit);
hold on
h2 = histfit(Blist,[],fit);
xlabel('Spatial Attribute Score');
ylabel('No. of Participants Answered');
title(sprintf('Distribution of SA scores for A vs B. All participant and mic scored stacked'));

set(h1(2),'color','r'); delete(h1(1));
set(h2(2),'color','g'); delete(h2(1));

%%