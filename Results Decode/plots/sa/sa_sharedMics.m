%% Perspective Test (Comapare arrays used at both A and B)
%{
    A(1) B(1) Spots
    A(6) B(5) IRT Cross
    A(7) B(6) Hamasaki Cube
    A(8) B(7) ST450
%}

sa_AB(1,:) = hash_spatAttAvg(1,:);
sa_AB(2,:) = spatialAttAvg(1,:);
index = 5;
for mic = 3:2:8
    sa_AB(mic,:) = hash_spatAttAvg(index+1,:);
    sa_AB(mic+1,:) = spatialAttAvg(index,:);
    index = index + 1;
end

% Plot for direct comparison
a = 1;
figure('name', 'sa_sharedMics');
bar(sa_AB','FaceColor',[a a a]);
whitebg('w');

title('Direct Comparison of Spatial Attribute Scores for Mics Shared At A & B');
ylabel('Average Score');
textLeg = {'Spots (A)','Spots (B)','IRT Cross (A)','IRT Cross (C->B)', 'Hamasaki Cube (A)', 'Hamasaki Cube (C->B)', 'ST450 (A)', 'ST450 (C->B)'};
textC = {'r','r','k','k','b','b','m','m',};

pos = zeros(8,1);
pos(1) = [0.64];
for q = 1:4
    for mic = 1:8
        pos(mic+1) = pos(mic)+0.1;
        %h = text(pos(mic) + (1*(q-1)),spatAttAvgMic_ALL(mic,q) + 0.02,textLeg{mic},'HorizontalAlignment','left');
        h = text(pos(mic) + (1*(q-1)),5.75,textLeg{mic},'HorizontalAlignment','right','FontSize',10.5,'color',textC{mic});
        set(h,'Rotation',90);
    end
end
grid on;
name = {'Locatedness','Sense of Space','Externalisation', 'Envelopment'};
set(gca,'xticklabel',name);
set(gca,'ytick',5:0.25:8.5);
ylim([5 8.5]);