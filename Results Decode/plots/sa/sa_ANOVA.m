%% Spatial Att ANOVA

% Create a group (all participants) with an avereage question score


AB_spatAttAvg_ANOVA(1:7,:) = spatialAttAvg(:,:);
AB_spatAttAvg_ANOVA(8:15,:) = hash_spatAttAvg(:,:);

% Performe ANOVA
p = anova1(AB_spatAttAvg_ANOVA');
