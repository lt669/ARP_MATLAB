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

fit = 'kernel';
h1 = histfit(Alist,[],fit);
hold on
h2 = histfit(Blist,[],fit);
xlabel('Spatial Attribute Score');
ylabel('No. of Participants Answered');
title(sprintf('Distribution of SA scores for Pos B microphones SA:'));

set(h1(2),'color','r'); delete(h1(1));
set(h2(2),'color','g'); delete(h2(1));

%%
% Plot distribution
histfit(A_q(4,:));
figure
fit = 'kernel';
%close all
h1 = histfit(B(1,:),[],fit);
hold on
h2 = histfit(B(2,:),[],fit);
h3 = histfit(B(3,:),[],fit);
h4 = histfit(B(4,:),[],fit);
h5 = histfit(B(5,:),[],fit);
h6 = histfit(B(6,:),[],fit);
h7 = histfit(B(7,:),[],fit);

xlabel('Spatial Attribute Score');
ylabel('No. of Participants Answered');
title('Distribution of SA scores for Pos B microphones (Avereaged Question Score)');

set(h1(2),'color','r'); delete(h1(1));
set(h2(2),'color','g'); delete(h2(1));
set(h3(2),'color','b'); delete(h3(1));
set(h4(2),'color','k'); delete(h4(1));
set(h5(2),'color','m'); delete(h5(1));
set(h6(2),'color','k'); delete(h6(1));
set(h7(2),'color','c'); delete(h7(1));

textLeg = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)'};
legend(textLeg);
grid on


