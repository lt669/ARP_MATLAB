%% Average Spatial Attribute score for each position

% Array containing avereage position A & B score for each question
for i =1:4
    AB_spatAttAvg_Mic(1,i) = sum(hash_spatAttAvg(:,i))/8;
    AB_spatAttAvg_Mic(2,i) = sum(spatialAttAvg(:,i))/7;
end
%% Plot Bar Chart
clf;
bar(AB_spatAttAvg_Mic'); hold on

% Calculate error bars + Plot
% Calc Mean
meanA = AB_spatAttAvg_Mic(1,:);
meanB = AB_spatAttAvg_Mic(2,:);

% Calc SD
N = 8;
sdA = sqrt(sum((hash_spatAttAvg-meanA).^2,1)/N);
N = 7;
sdB = sqrt(sum((spatialAttAvg-meanB).^2,1)/N);

% Calc limits
b1A = meanA - sdA;
b2A = meanA + sdA;
b1B = meanB - sdB;
b2B = meanB + sdB;
diff = [(b1A - b2A);(b1B - b2B)]

% Plot error bars first
offset = 0.15;
xVec = 1:4;
plot(xVec - offset,[b1A;b2A],'+','color','k', 'linewidth',2, 'MarkerSize',10);
plot(xVec + offset,[b1B;b2B],'+','color','k', 'linewidth',2, 'MarkerSize',10);

title('Average Spatial Attribute Scores For Position A & B with averaged mic score');
xlabel('Spatial Attribute Questions');
ylabel('Average Score (All Mics)');
name = {'Locatedness','Sense of Space','Externalisation', 'Envelopment'};
set(gca,'xticklabel',name);
set(gca,'ytick',5:0.25:8.5);
ylim([5 8.5]);
leg = legend('Position A','Position B','Error Markers');
set(leg,'location','best');