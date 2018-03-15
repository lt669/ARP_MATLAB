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

%%
% Plot distribution
histfit(A_q(1,:));
