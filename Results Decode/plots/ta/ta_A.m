%% Position A
bar(timbreResults_H');
title(sprintf('Percentage of Participants Chose Timbral Attributes for each Microphone Array'));
name = {'Full','Bright','Flat','Rich', 'Realistic', 'Loud'};
set(gca,'xticklabel',name)
ylim([0 100]);
xlabel('Timbral Attributes');
ylabel('Participants (%)');
leg = legend('Spots','Eigen', 'ESMA', 'ORTF', 'A\_ST450','C\_IRT', 'C\_Hamasaki Cube', 'C\_ST450');
set(leg,'location','best');