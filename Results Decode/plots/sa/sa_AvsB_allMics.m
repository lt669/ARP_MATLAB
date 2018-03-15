%% Plot together but seperate tests
spatAttAvgMic_ALL_Split = zeros(8,8);
% spatAttAvgMic_ALL_Split(1:7,1:4) = spatialAttAvg;
% spatAttAvgMic_ALL_Split(1:8,5:8) = hash_spatAttAvg;

index = 1;
for i=1:2:7
    spatAttAvgMic_ALL_Split(1:7,i+1) = spatialAttAvg(1:7,index);
    spatAttAvgMic_ALL_Split(1:8,i) = hash_spatAttAvg(1:8,index);
    index = index + 1;
end
colors = {'b', 'r', 'g', 'c', 'm', 'y', 'k', 'w'};

bar(spatAttAvgMic_ALL_Split');


leg = legend('Spots','OCT + Spots', 'PCMA + Spots', 'AMBEO + Spots', 'IRT Cross + Spots', 'Hamasaki Cube + Spots', 'ST450 + Spots');
name = {'Locatedness (A)','Locatedness (B)','Sense of Space (A)','Sense of Space (B)','Externalisation (A)','Externalisation (B)', 'Envelopment (A)', 'Envelopment (B)'};
set(gca,'xticklabel',name);
set(gca,'ytick',5:0.25:8.5);
ylim([5 8.5]);
