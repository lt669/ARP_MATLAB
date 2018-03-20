%% Average across SA questions and for each microphone

% Position A (participants per mic)

% All data
A_u = cell2mat(hash_xlRaw(:,3:6,2:20));
% Mic data avereaged across SA
A = squeeze(sum(A_u,2)/4);
Amiclist = squeeze(sum(A,2)/19);
% Create long list of all participant results for A and B
% par = 38, q = 4, mics = 7 Total = 1064
%Alist = zeros(1,812);
% B Data
B_u = permute(cell2mat(sortedArray(:,:,2:5)),[1 3 2]);
B = squeeze(sum(B_u,2)/4);
Bmiclist = squeeze(sum(B,2)/38);

% Test the variance
vA = var(Amiclist);
vB = var(Bmiclist);

% Test for a normal distribution
adA = adtest(Amiclist);
adB = adtest(Bmiclist);

vt = vartest(Bmiclist,vA);

% Statistical Significants
[h,p,ci,stats] = ttest2(Amiclist,Bmiclist,'vartype','unequal');

%% Plot distribution for each question
close all

fit = 'normal';
h1 = histfit(Amiclist,[],fit);
hold on
h2 = histfit(Bmiclist,[],fit);
xlabel('Spatial Attribute Score');
ylabel('No. of Participants Answered');
title(sprintf('Distribution of SA scores for Pos B microphones SA:'));

set(h1(2),'color','r'); delete(h1(1));
set(h2(2),'color','g'); delete(h2(1));

%%