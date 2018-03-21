%% Average Spatial Attribute score for each position

% Array containing avereage position A & B score for each question
for i =1:4
    AB_spatAttAvg_Mic(1,i) = sum(hash_spatAttAvg(:,i))/8;
    AB_spatAttAvg_Mic(2,i) = sum(spatialAttAvg(:,i))/7;
end
%%
bar(AB_spatAttAvg_Mic');
title('Average Spatial Attribute Scores For Position A & B with averaged mic score');
xlabel('Spatial Attribute Questions');
ylabel('Average Score (All Mics)');
name = {'Locatedness','Sense of Space','Externalisation', 'Envelopment'};
set(gca,'xticklabel',name);
set(gca,'ytick',5:0.25:8.5);
ylim([5 8.5]);
leg = legend('Position A','Position B');
set(leg,'location','best');