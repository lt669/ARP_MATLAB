%% Avereage Spatial Attribute Score For Each Mic
spatAttAvgMic_ALL = zeros(15,4);
spatAttAvgMic_ALL(1:7,:) = spatialAttAvg;
spatAttAvgMic_ALL(8:15,:) = hash_spatAttAvg(1:8,:);

figure();
% Plot 
a = 1;
bar(spatAttAvgMic_ALL','FaceColor',[a a a]);
whitebg('w');
% Add text
pos = [0.62];
for i = 2:15
    pos(i) = pos(i-1) + 0.0535;
end
textLeg = {'Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (C->B)', 'Hamasaki Cube (C->B)', 'ST450 (C->B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)'};
textC = {'r','k','k','k','b','m','c','r','k','k','k','k','b','m','c'};
for q = 1:4
    for mic = 1:15
        %h = text(pos(mic) + (1*(q-1)),spatAttAvgMic_ALL(mic,q) + 0.02,textLeg{mic},'HorizontalAlignment','left');
        h = text(pos(mic) + (1*(q-1)),5.75,textLeg{mic},'HorizontalAlignment','right','FontSize',10.5,'color',textC{mic});
        set(h,'Rotation',90);
    end
end


title('Average Spatial Attribute Scores Across Microphone Configurations For Each Questions (ALL)');
xlabel('Spatial Attribute Questions');
ylabel('Average Score');

name = {'Locatedness','Sense of Space','Externalisation', 'Envelopment'};
set(gca,'xticklabel',name);
set(gca,'ytick',5:0.25:8.5);
ylim([5 8.5]);
grid on;
%leg = legend('Spots (B)','OCT (B)', 'PCMA (B)', 'AMBEO (B)', 'IRT Cross (B)', 'Hamasaki Cube (B)', 'ST450 (B)','Spots (A)','Eigen (A)','ESMA (A)','ORTF (A)','ST450 (A)','IRT (C)','Hamasaki (C)','ST450(C)');
%set(leg,'location','best');
