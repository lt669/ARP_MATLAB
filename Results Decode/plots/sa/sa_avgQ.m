%% Avereage Spatial Attribute score for all questions for each mic

for i = 1:7
    AB_spatAttAvg_Q(i) = sum(spatialAttAvg(i,:))/4;
end
for i =1:8
    AB_spatAttAvg_Q(i+7) = sum(hash_spatAttAvg(i,:))/4;
end

bar(AB_spatAttAvg_Q','w');
title('Average Spatial Attribute Scores For All Microphones');
xlabel('Microphone Configurations');
ylabel('Average Score (All Questions)');

textLeg = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)'};
for i=1:15
    h = text(i,5.25,textLeg{i},'HorizontalAlignment','left','FontSize',10.5);
    set(h,'Rotation',90);
end

grid on;
set(gca,'ytick',5:0.25:8.5);
ylim([5 8.5]);

% Unused for now
%name = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)'};
set(gca,'xticklabel',[]);