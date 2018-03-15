%% Position B
bar(timbreResults');
title(sprintf('Percentage of Participants Chose Timbral Attributes for each Microphone Array'));
name = {'Full','Bright','Flat','Rich', 'Realistic', 'Loud'};
set(gca,'xticklabel',name)
ylim([0 100]);
xlabel('Timbral Attributes');
ylabel('Participants (%)');
leg = legend('Spots','OCT + Spots', 'PCMA + Spots', 'AMBEO + Spots', 'IRT Cross + Spots', 'Hamasaki Cube + Spots', 'ST450 + Spots');
set(leg,'location','best');