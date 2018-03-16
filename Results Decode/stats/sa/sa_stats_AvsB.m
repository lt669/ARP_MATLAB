%% Average across SA questions and for each microphone

% Position A (participants per mic)
A = squeeze(sum(cell2mat(hash_xlRaw(:,3:6,2:20)),2)/4);
A_q = squeeze(sum(cell2mat(hash_xlRaw(:,3:6,2:20)),1)/8);
% Participants
A_p = sum(A,1)/8;

% Position B (participants per mic)
B = squeeze(sum(cell2mat(sortedArray(:,:,2:5)),3)/4);
B_q = squeeze(sum(cell2mat(sortedArray(:,:,2:5)),1)/7);
B_q = B_q';
% Participants
B_p = squeeze(sum(B,1)/7);

% Test the variance
vA = var(A_q');
vB = var(B_q');

for i = 1:4
    % Test for a normal distribution
    adA(i) = adtest(A_q(i,:));
    adB(i) = adtest(B_q(i,:));
    
    vt(i) = vartest(B_q(i,:),vA(i));
end

% Statistical Significants
[h,p,ci,stats] = ttest2(A_q',B_q');
[h_s,p_s] = ttest2(A_q(3,:),B_q(3,:),'vartype','unequal');

% Look into A vs B with avereaged question scores?
AvB(1:19,1) = A_p;
AvB(20:38) = nan;
AvB(1:38,2) = B_p;


%%
% Plot distribution
histfit(A_q(1,:));

fit = 'kernel';
close all
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


