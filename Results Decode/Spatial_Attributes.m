%==========----------| Calculate Average Results

%-| Averaged Spatial Attributes Results
% sortedArray(mic,par,2:5)
%{
spatialAtt Array:
    Q1: Locatedness
    Q2: Sense of Space
    Q3: Externalisation
    Q4: Envelopment
%}
for mic=1:7     % 7 mics
    for q=1:4   % 4 questions
        spatialAttAvg(mic,q) = sum(cell2mat(sortedArray(mic,:,q+1)))/noOfPar;
    end
    % Average per mic array
    spatialAttAvgMic(mic) = sum(spatialAttAvg(mic,:))/4;
end

%=========----------| Averaged Spatial Attributes Results
clf;
bar(spatialAttAvg');
ylim([5 8.5]);
grid on;

title('Average Spatial Attribute Scores Across Microphone Configurations');
xlabel('Spatial Attribute Questions');
ylabel('Average Score');

name = {'Locatedness','Sense of Space','Externalisation', 'Envelopment'};
set(gca,'xticklabel',name);
set(gca,'ytick',5:0.25:8.5);

leg = legend('Spots','OCT + Spots', 'PCMA + Spots', 'AMBEO + Spots', 'IRT Cross + Spots', 'Hamasaki Cube + Spots', 'ST450 + Spots');
set(leg,'location','best');
%% =========----------| All participants answers across questions

graphMic = 1; % | Choose whch mic to plot
switch graphMic
    case 1,
        micName = 'Spots';
    case 2,
        micName = 'OCT';
    case 3,
        micName = 'PCMA';
    case 4,
        micName = 'AMBEO';
    case 5,
        micName = 'IRT Cross';
    case 6,
        micName = 'Hamasaki Cube';
    case 7,
        micName = 'ST450';
end
   
spatialAttAll(:,:) = cell2mat(sortedArray(graphMic,:,2:5));
bar(spatialAttAll');
title(sprintf('Participant Answers for Mic: %s',micName));
name = {'Locatedness','Sense of Space','Externalisation', 'Envelopment'};
set(gca,'xticklabel',name)
ylim([0 10]);
xlabel('Questions');
ylabel('Score');

