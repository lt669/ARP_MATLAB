%% ALL

% Concatenate Results
timbralAtt_ALL(1:7,:) = timbreResults(1:7,:);
timbralAtt_ALL(8:15,:) = timbreResults_H;

a = 1;
b = bar(timbralAtt_ALL','hist');
%b = bar(timbralAtt_ALL');

set(b,'FaceColor',[a a a]);
title(sprintf('Percentage of Participants Timbral Attributes were chosen for each Microphone Array'));
name = {'Full','Bright','Flat','Rich', 'Realistic', 'Loud'};
set(gca,'xticklabel',name)
ylim([0 100]);
xlabel('Timbral Attributes');
ylabel('Participants (%)');

textLeg = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)'};
textC = {'r','k','k','k','b','m','c','r','k','k','k','k','b','m','c'};
pos = [0.62];
for i = 2:15
    pos(i) = pos(i-1) + 0.0535;
end
for q = 1:6
    for mic = 1:15
        %h = text(pos(mic) + (1*(q-1)),spatAttAvgMic_ALL(mic,q) + 0.02,textLeg{mic},'HorizontalAlignment','left');
        h = text(pos(mic) + (1*(q-1)),1,textLeg{mic},'HorizontalAlignment','left','FontSize',8,'color',textC{mic});
        set(h,'Rotation',90);
    end
end
